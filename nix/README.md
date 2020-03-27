# Nix Packaging of ATW

## In This Repo

`atw.nix` is a barebones Nix recipe for building timewarp from source. To 
run it, you will need to zip visual_postprocessing/src into a tar.gz file
named `atw.tar.gz` and place it in `/nix/`.

To zip source, run: `tar -czvf atw.tar.gz ../src/`

Then, execute: `nix-build atw.nix` to build.

This will download Nix recipes for all dependencies of ATW (listed below)
as well as their development versions. It will then attempt to build ATW 
within the Nix environment. We are also including `coreutils-full` to 
get access to debug commands such as `stat` and `ls`.

The Nix file will run `builder.sh` which is built on Nix Pill 8.2. 
It is a barebones generic build script that will load all dependencies 
into `PATH` as well as load all include directories into `CPATH` for gcc. 
It will then print out all included directories visible to gcc for
debugging purposes.

Currently this Nix file can link `libpng` and `freeglut` to the ATW
main program. There is an error in building `freeglut-dev` however, as
`freeglut` relies on the file `<GL/gl.h>` which is not included with its
Nix package. 

On `apt`, the `libmesa-dev` package includes `<GL/gl.h>` 
(as does `freeglut 3`), however, the Nix versions do not. This issue
is currently being worked on.

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
