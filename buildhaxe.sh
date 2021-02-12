#!/bin/sh

#exit on error
set -e

#REQUIRES https://haxe.org to be installed!
cd src/kubejs/server
haxe build.hxml

