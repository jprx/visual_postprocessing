
# Setup NIX Environment:
source $stdenv/setup

# Redefine $PATH to include what we need:
#PATH=$perl/bin:$PATH

# Build the binary
make
