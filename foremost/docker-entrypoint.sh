#!/bin/sh

location="out/$1"
rm -rf out/output
command="foremost $location -o out/output/"
$command


