variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    cloudsqlproxy        = string
    ctlog-createctconfig = string
    ctlog-managectroots  = string
    ctlog-verifyfulcio   = string
    fulcio-createcerts   = string
    getoidctoken         = string
    rekor-createsecret   = string
    trillian-createdb    = string
    trillian-createtree  = string
    trillian-updatetree  = string
    tsa-createcertchain  = string
    tuf-createsecret     = string
  })
}

# TODO: Add testing for these once we are able to stand up all of sigstore.