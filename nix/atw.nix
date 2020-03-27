with (import <nixpkgs> {});
derivation {
  name = "atw";
  builder = "${bash}/bin/bash";
  args = [ ./builder.sh ];
  buildInputs = lib.strings.makeSearchPathOutput "dev" "bin" [ gnutar gzip gnumake gcc coreutils-full freeglut libGLU libGL glibmm libpng ];
  nativeBuildInputs = [gnutar gzip gnumake gcc freeglut libGLU libGL glibmm libpng ];
  buildIncludeDirs = lib.strings.makeSearchPathOutput "dev" "include" [ freeglut libGLU libGL glibmm libpng ];
  src = ./atw.tar.gz;
  system = builtins.currentSystem;
}