#!/bin/sh

for file in $(find ./locale -name "*.cfg"); do
    sed -i 's/\([^=]\)=\(.*\)/\1="\2"/' $file
done
