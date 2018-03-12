#!/bin/sh

location="out/$1"
rm -rf out/output
command="bulk_extractor $location -o out/output/"
$command


