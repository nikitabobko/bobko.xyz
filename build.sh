#!/usr/bin/env bash
set -e # Exit if one of commands exit with non-zero exit code
set -u # Treat unset variables and parameters other than the special parameters ‘@’ or ‘*’ as an error
set -o pipefail # Any command failed in the pipe fails the whole pipe
# set -x # Print shell commands as they are executed (or you can try -v which is less verbose)
cd "$(dirname "$0")"

release=0
adoc_args=()
while test $# -gt 0; do
    case "$1" in
        --release)
            release=1
            adoc_args+=(--attribute relfilesuffix) # Drop html suffix in links
            shift;;
        *) echo "Unknown arg $1" > /dev/stderr; exit 1;;
    esac
done

mkdir -p .build && rm -rf ./.build/*

if test $release = 1; then
    ./generate.sh
fi

cp -r src/* .build
cd .build
bundler exec asciidoctor \
    "${adoc_args[@]}" \
    ./index.adoc 2>&1 \
    | sed '/level 0 sections can only be used when doctype is book/d'
bundler exec asciidoctor \
    "${adoc_args[@]}" \
    --attribute sectanchors \
    --attribute sectlinks \
    --attribute sectnums \
    --attribute rootdir=.. \
    --attribute docinfodir=.. \
    ./blog/*.adoc 2>&1 \
    | sed '/level 0 sections can only be used when doctype is book/d'
rm -rf -- *.adoc **/*.adoc
