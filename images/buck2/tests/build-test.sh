#!/bin/bash

git config --global --add safe.directory /work

# Run through the getting started from here: https://buck2.build/docs/getting_started/

git clone -n https://github.com/facebook/buck2-prelude work && pushd work
git checkout 18cddc2c5293ff0cf710d042f927ae54ffba9c4a

ls -aR .

# buck2 init --git

# Build the hello world program
buck2 build //:main

# Run the hello world program
buck2 run //:main
