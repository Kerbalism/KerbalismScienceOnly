#!/bin/bash

while IFS= read -r file; do
  echo "deleting: $file"
  rm -f GameData/KerbalismScienceOnly/$file

  for f in `ls ../Kerbalism/GameData/KerbalismConfig/$file`; do
    if [ -f $f ]; then
      dest=`echo $f | sed -e s-../Kerbalism/-- -e s-KerbalismConfig-KerbalismScienceOnly-`
      echo "copying: $f -> $dest"
      cp $f $dest 
    fi
  done
done < filelist

