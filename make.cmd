@echo off

SET HLUAC=java -jar lib/hluac.jar -outext .lua

RD /S/Q luapp51 2> NUL
RD /S/Q luapp50 2> NUL

MD luapp51
MD luapp50

echo ++

%HLUAC% -err -lint -in . -d luapp51
%HLUAC% -err -lua50 -d luapp51 errfmt.hlua

%HLUAC% -err -lua50 -lint -in . -d luapp50 -include lua50-misc/_include.lua

echo ++

echo ' copy files for 51 ...'
copy LICENSE luapp51\ > NUL
copy README  luapp51\ > NUL

echo ' copy files for 50 ...'
copy LICENSE luapp50\ > NUL
copy README  luapp50\ > NUL
copy lua50-misc\_compat-5.1.lua luapp50\ > NUL
copy lua50-misc\test50.sh       luapp50\ > NUL

echo ++
