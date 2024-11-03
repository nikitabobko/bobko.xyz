#!/usr/bin/env bash
set -e # Exit if one of commands exit with non-zero exit code
set -u # Treat unset variables and parameters other than the special parameters ‘@’ or ‘*’ as an error
set -o pipefail # Any command failed in the pipe fails the whole pipe
# set -x # Print shell commands as they are executed (or you can try -v which is less verbose)
cd "$(dirname "$0")"

# WIP

python3 -m venv venv
source ./venv/bin/activate
python3 -m pip install 'livereload==2.7.0'

find src -type f | entr './build.sh' &
livereload ./.build/ &

wait
