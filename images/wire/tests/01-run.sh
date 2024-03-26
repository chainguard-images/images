#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

TMPDIR="$(mktemp -d)"
chmod go+wrx $TMPDIR
cd $TMPDIR


# This is a bit weird, but it's cribbed from here: https://github.com/google/wire/blob/main/_tutorial/README.md
cat <<EOF > main.go
package main

import "fmt"

type Message string

func NewMessage() Message {
    return Message("Hi there!")
}

func NewGreeter(m Message) Greeter {
    return Greeter{Message: m}
}

type Greeter struct {
    Message Message
}

func (g Greeter) Greet() Message {
    return g.Message
}

func NewEvent(g Greeter) Event {
    return Event{Greeter: g}
}


type Event struct {
    Greeter Greeter
}

func (e Event) Start() {
    msg := e.Greeter.Greet()
    fmt.Println(msg)
}

func main() {
    e := InitializeEvent()

    e.Start()
}
EOF

cat <<EOF > wire.go
//+build wireinject

package main

import "github.com/google/wire"

func InitializeEvent() Event {
    wire.Build(NewEvent, NewGreeter, NewMessage)
    return Event{}
}
EOF

docker run -w /src -v $(pwd):/src --entrypoint=go $IMAGE_NAME mod init example.com/hello
docker run -w /src -v $(pwd):/src --entrypoint=go $IMAGE_NAME mod tidy

docker run -w /src -v $(pwd):/src $IMAGE_NAME gen

# This file should be generated!
cat wire_gen.go | grep InitializeEvent
