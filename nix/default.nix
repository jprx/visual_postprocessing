let
  pkgs = import <nixpkgs> {};
in
with (import <nixpkgs> {});
pkgs.stdenv.mkDerivation {
	name="illixr-atw-1.0.0";
	src=../src;
	buildInputs = [freeglut libGLU libGL glibmm libpng];
	builder=./atw_builder.sh;
	system=builtins.currentSystem;
}
