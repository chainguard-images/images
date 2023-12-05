#!/usr/bin/env sh

set -o errexit -o nounset -o errtrace -o pipefail -x

TMPDIR="$(mktemp -d)"
cd $TMPDIR

cat <<EOF > "hello.erl"
-module(hello).
-export([hello_world/0]).

hello_world() -> io:fwrite("hello, world\n").
EOF

erlc hello.erl

erl -noshell -pa . -eval "hello:hello_world()." -s init stop
