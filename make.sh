#! /bin/sh

HLUAC='java -jar lib/hluac.jar -outext .lua'

rm -rf luapp51/
rm -rf luapp50/

mkdir luapp51 >&2-
mkdir luapp50 >&2-

echo ++

$HLUAC -err -lint -in . -d luapp51
$HLUAC -err -lua50 -d luapp51 errfmt.hlua

$HLUAC -err -lua50 -lint -in . -d luapp50 -include lua50-misc/_include.lua

echo ++

echo ' copy files for 51 ...'
cp LICENSE luapp51/
cp README  luapp51/

echo ' copy files for 50 ...'
cp LICENSE luapp50/
cp README  luapp50/
cp lua50-misc/_compat-5.1.lua luapp50/
cp lua50-misc/test50.sh       luapp50/

echo ++
