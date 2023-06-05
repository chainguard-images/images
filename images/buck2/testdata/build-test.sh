#!/bin/bash

# Run through the getting started from here: https://buck2.build/docs/getting_started/

tmpdir=$(mktemp -d)
cd $tmpdir

buck2 init --git

# Create a hello world c++ file
cat > hello.cpp <<EOF
#include <iostream>
int main() {
    std::cout << "Hello from a C++ Buck2 program!" << std::endl;
}
EOF

# Create a buck rule with this

cat > BUCK <<EOF
cxx_binary(
    name = 'main',
    srcs = ['hello.cpp'],
)
EOF

# Add the cxx toolchain to toolchains/BUCK

cat >> toolchains/BUCK <<EOF
load("@prelude//toolchains:cxx.bzl", "system_cxx_toolchain")
load("@prelude//toolchains:python.bzl", "system_python_bootstrap_toolchain")

system_cxx_toolchain(
    name = "cxx",
    visibility = ["PUBLIC"],
)

system_python_bootstrap_toolchain(
    name = "python_bootstrap",
    visibility = ["PUBLIC"],
)
EOF

# Build the hello world program

buck2 build //:main

# Run the hello world program

buck2 run //:main
