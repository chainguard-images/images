using System;
using System.Security.Cryptography;
using System.Security.Cryptography.X509Certificates;
using System.Text;

class Program
{
    static void Main(string[] args)
    {
        if (args.Length == 0)
        {
            Console.WriteLine("need an arg: keypair or validate");
            Environment.Exit(1);
        }

        switch (args[0])
        {
            case "keypair":
                CreateKeyPair();
                break;
            case "validate":
                VerifySignature();
                break;
            default:
                Console.WriteLine("missing keypair or validate option");
                Environment.Exit(1);
                break;
        }
    }
    static void CreateKeyPair()
    {
        using var ecdsa = ECDsa.Create(ECCurve.NamedCurves.nistP256);

        // save pem formatted key
        string caKey = ConvertPrivateKeyToPem(ecdsa);
        File.WriteAllText("ca_key.pem", caKey);
        Console.WriteLine("Private key saved to ca_key.pem");

        // make a cert request to self-sign later
        string caSubjectName = "CN=CA, O=Chainguard, C=US";
        var caRequest = new CertificateRequest(new X500DistinguishedName(caSubjectName), ecdsa, HashAlgorithmName.SHA256);

        // add CA extensions
        caRequest.CertificateExtensions.Add(new X509BasicConstraintsExtension(true, false, 0, true));
        caRequest.CertificateExtensions.Add(new X509KeyUsageExtension(X509KeyUsageFlags.KeyCertSign | X509KeyUsageFlags.CrlSign, true));

        // self-signed as CA root cert
        DateTimeOffset startDate = DateTimeOffset.UtcNow;
        DateTimeOffset expiryDate = startDate.AddDays(2);
        using var caCertificate = caRequest.CreateSelfSigned(startDate, expiryDate);

        // save pem formatted cert
        string caCertPem = ConvertCertToPem("CERTIFICATE", caCertificate.RawData);
        File.WriteAllText("ca_cert.pem", caCertPem, Encoding.UTF8);
        Console.WriteLine("CA certificate saved to ca_cert.pem");

    }

    static string ConvertPrivateKeyToPem(ECDsa ecdsa)
    {
        byte[] privateKeyBytes = ecdsa.ExportECPrivateKey();
        string base64 = Convert.ToBase64String(privateKeyBytes, Base64FormattingOptions.InsertLineBreaks);
        return $"-----BEGIN EC PRIVATE KEY-----\n{base64}\n-----END EC PRIVATE KEY-----\n";
    }
    static string ConvertCertToPem(string type, byte[] data)
    {
        string base64 = Convert.ToBase64String(data, Base64FormattingOptions.InsertLineBreaks);
        return $"-----BEGIN {type}-----\n{base64}\n-----END {type}-----\n";
    }

    static void VerifySignature()
    {
        // load private CA key
        string privateKeyPem = File.ReadAllText("ca_key.pem");
        using var caKey = ECDsa.Create();
        caKey.ImportFromPem(privateKeyPem);

        // load public CA cert
        string certPem = File.ReadAllText("ca_cert.pem");
        byte[] certDer = Convert.FromBase64String(ExtractBase64FromPem(certPem));
        var caCertificate = new X509Certificate2(certDer);

        using var certPublicKey = caCertificate.GetECDsaPublicKey();

        byte[] certPublicKeyBytes = certPublicKey.ExportSubjectPublicKeyInfo();
        byte[] keyPublicKeyBytes = caKey.ExportSubjectPublicKeyInfo();

        // Compare the public key byte arrays
        bool isValid = certPublicKeyBytes.SequenceEqual(keyPublicKeyBytes);

        if (!isValid)
        {
            Console.WriteLine("CA signature does NOT match the private key");
            Environment.Exit(1);
        }

        Console.WriteLine("cert is signed by private key");

    }
    static string ExtractBase64FromPem(string pem)
    {
        return pem.Replace("-----BEGIN CERTIFICATE-----", "")
                  .Replace("-----END CERTIFICATE-----", "")
                  .Replace("\n", "")
                  .Replace("\r", "")
                  .Trim();
    }
}