#!/usr/bin/env bash
set -e # Exit if one of commands exit with non-zero exit code
set -u # Treat unset variables and parameters other than the special parameters ‘@’ or ‘*’ as an error
set -o pipefail # Any command failed in the pipe fails the whole pipe
# set -x # Print shell commands as they are executed (or you can try -v which is less verbose)
# cd "$(dirname "$0")"

rm -rf .build && mkdir .build
cp -r src/* .build
cd .build
bundler exec asciidoctor ./index.adoc 2>&1 | sed '/level 0 sections can only be used when doctype is book/d'
bundler exec asciidoctor ./blog/*.adoc 2>&1 | sed '/level 0 sections can only be used when doctype is book/d'
rm -rf -- *.adoc

