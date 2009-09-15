#! /bin/sh

lua50 -l _compat-5.1.lua test_luapp.lua
lua50 -l _compat-5.1.lua test_zpp.lua 

echo ++
