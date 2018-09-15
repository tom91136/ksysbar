#! /bin/sh

set -e
for cmd in "tsc" "entr" "plasmoidviewer"; do
    command -v $cmd || (echo "no $cmd detected"; exit 1)
done

tsc --watch & find package -regex ".*\.\(qml\|js\)$" | entr -r plasmoidviewer --applet package