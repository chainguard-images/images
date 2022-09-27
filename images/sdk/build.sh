#!/bin/sh -ex

if [[ "${DESTDIR}" == "" ]]; then
    echo "Must set DESTDIR in environment. Exiting."
    exit 1
fi

export PATH="${DESTDIR}/usr/bin:${PATH}"

# TODO: package bubblewrap in melange
if [[ ! -f bubblewrap-0.6.2.tar.xz ]]; then
    wget https://github.com/containers/bubblewrap/releases/download/v0.6.2/bubblewrap-0.6.2.tar.xz
fi
printf "%s  %s\n" '8a0ec802d1b3e956c5bb0a40a81c9ce0b055a31bf30a8efa547433603b8af20b' bubblewrap-0.6.2.tar.xz | sha256sum -c
if [[ ! -d bubblewrap-0.6.2 ]]; then
    tar -xvf bubblewrap-0.6.2.tar.xz
fi
(cd bubblewrap-0.6.2/ && ./autogen.sh && make && make install)

# goimports
go install golang.org/x/tools/cmd/goimports@latest

# melange
git clone https://github.com/chainguard-dev/melange.git
(cd melange && make melange install)

# apko
git clone https://github.com/chainguard-dev/apko.git
(cd apko && make apko install)

# go build/module cache
mkdir "${DESTDIR}/root"
mv /root/.cache "${DESTDIR}/root/.cache"
mv /root/go "${DESTDIR}/root/go"

# sdk entrypoint
SDK_ENTRYPOINT="${DESTDIR}/usr/bin/sdk"
echo '#!/bin/bash -e' > "${SDK_ENTRYPOINT}"
echo 'printf "\nWelcome to the development environment!\n\n\n"' >> "${SDK_ENTRYPOINT}"
echo 'export PS1="[sdk] ❯ "' >> "${SDK_ENTRYPOINT}"
echo 'export PATH="/root/go/bin:${PATH}"' >> "${SDK_ENTRYPOINT}"
echo 'export CGO_ENABLED=0' >> "${SDK_ENTRYPOINT}"
echo 'bash -i' >> "${SDK_ENTRYPOINT}"
chmod +x "${SDK_ENTRYPOINT}"
