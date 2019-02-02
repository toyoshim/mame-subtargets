#!/bin/bash

for f in scripts/target/mame/*; do
  (cd ../mame/scripts/target/mame && ln -sf ../../../../mame-subtargets/$f)
done

for f in src/mame/*; do
  (cd ../mame/src/mame && ln -sf ../../../mame-subtargets/$f)
done
