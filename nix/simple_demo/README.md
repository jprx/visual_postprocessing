# Simple-Demo
See `Nix Pill 7.7` for more info on this.

Build: ```nix-build simple.nix```

Usage: ```./result/simple```
(Can also run from ```/nix/store/{HASH}-demo/simple```) 

Demonstrates using a hardcoded Nix derivation to build a C file that uses
coreutils from source. Also demonstrates using a builder shell script
delegate for building the project. Will install to ```/nix/store/```.
