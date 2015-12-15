#!/bin/sh

echo $@
./configure --prefix=$PREFIX --target=$TARGET --host=$TARGET $@
