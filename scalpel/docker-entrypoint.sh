#!/bin/sh

location="out/$1"
rm -rf out/output
command="scalpel -o out/output/ $location"
$command


