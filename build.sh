#! /bin/sh

set -e
for cmd in "tsc" "plasmapkg2"; do
    command -v $cmd || (echo "no $cmd detected"; exit 1)
done

tsc && plasmapkg2 -t plasmoid -i ./package