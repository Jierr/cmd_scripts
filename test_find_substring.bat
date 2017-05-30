@echo off

set "sub=14gb a"
set "str=Hallo 123141 14gb aaasd as 9999aad"
set pos=pos
call find_substring %pos% "%str%" "%sub%"
echo Ergebnis "%pos%"


set "sub=1abs"
set "str=Hallo 123141 14gb aaasd as 9999aad"
set pos=pos
call find_substring %pos% "%str%" "%sub%"
echo Ergebnis "%pos%"

set "sub=Hallo"
set "str=Hallo 123141 14gb aaasd as 9999aad"
set pos=pos
call find_substring %pos% "%str%" "%sub%"
echo Ergebnis "%pos%"

set "sub=ad"
set "str=Hallo 123141 14gb aaasd as 9999aad"
set pos=pos
call find_substring %pos% "%str%" "%sub%"
echo Ergebnis "%pos%"

set "sub=l"
set "str=Hallo 123141 14gb aaasd as 9999aad"
set pos=pos
call find_substring %pos% "%str%" "%sub%"
echo Ergebnis "%pos%"

set "sub=Hallo 123141 14gb aaasd as 9999aad"
set "str=Hallo 123141 14gb aaasd as 9999aad"
set pos=pos
call find_substring %pos% "%str%" "%sub%"
echo Ergebnis "%pos%"

set "sub=Hallo 123141 14gb aaasd as 9999aad sdg dgdf d"
set "str=Hallo 123141 14gb aaasd as 9999aad"
set pos=pos
call find_substring %pos% "%str%" "%sub%"
echo Ergebnis "%pos%"
