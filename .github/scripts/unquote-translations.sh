#!/bin/sh

for file in $(find ./locale -name "*.cfg"); do
    perl -pi -e 's/([^=])="(.*)"/\1=\2/' $file
done
