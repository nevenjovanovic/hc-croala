#!/usr/bin/env bash
# croala-select-single.sh, 2016-05-20
# move all files with single divs into separate croala-hc directory
# list of names in file1divlist.txt
# usage: ./croala-select-single.sh

set -o errexit
set -o pipefail
set -o nounset

while read places; do

rsync -avzP ${places} /home/neven/rad/croala-r/hc-croala/txts/

done<file1divlist.txt
