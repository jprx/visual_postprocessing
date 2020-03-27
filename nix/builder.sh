set -e
unset PATH
for p in $buildInputs; do
  export PATH=$p/${PATH:+:}$PATH
  #echo $p
done

for p in $buildIncludeDirs; do
	export CPATH=$p/${CPATH:+:}$CPATH
	#echo $p
done

tar -xf $src

for d in *; do
  if [ -d "$d" ]; then
    cd "$d"
    break
  fi
done

#cd /nix/store/jdwp5nclvvazsw6bmdacqgx87yyw2g0b-libpng-apng-1.6.37-dev/bin/include
#ls

echo $CPATH
echo ""
echo "Included files:"
echo | gcc -E -Wp,-v -
echo ""
make