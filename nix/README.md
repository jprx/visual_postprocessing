# Nix Packaging of ATW

## Nix Resources:
Good introductory tutorial on intro to Nix lang + packages:

https://github.com/shajra/example-nix/blob/master/tutorials/0-nix-intro/README.md

Pkgs-make attempts to reduce boilerplate code for Nix packages for C/C++ libraries:

https://github.com/shajra/example-nix/tree/master/tutorials/1-pkgs-make
(Use this in the future?)

The Official Nix manual section 14.4 has issues and won't compile, fix is here:

https://github.com/NixOS/nix/issues/2259

Example default.nix file for libPNG:

https://github.com/NixOS/nixpkgs/blob/master/pkgs/development/libraries/libpng/default.nix

Tutorial on building C/C++ Nix packages:

https://gist.github.com/CMCDragonkai/41593d6d20a5f7c01b2e67a221aa0330

Nix "Pills":

https://nixos.org/nixos/nix-pills/index.html

# Dependencies for ATW:

`-lGLUT (freeglut3)`
Nix package: `freeglut` (latest is `3.2.1`)

`-lGLU (MESA GL Utilities)`
Nix package: `libGLU` (latest is `9.0.1`)

`-lGL (OpenGL)`
Nix package: `libGL` (latest is `1.2.0`)

`-lm (Math library libm)`
Nix shouldn't need this as every compiler in the past 30 years can figure this one out.
If necessary, put this in Makefile only.
@TODO: Replace with Eigen?
Nix has eigen: `eigen` (`"eigen-3.3.7"`)
Nix package: `glibmm` (`GLIBC` version of `libm`)

`-lpng (Lib PNG)`
Nix package: `libpng` (latest is `"libpng-apng-1.6.37"`)
