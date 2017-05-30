@echo off

set number=number
set "str=Hallo 123141 14gb aaasd as 9999aad"

call find_number %number% "%str%"
echo Ergebnis "%number%"
set number=number
set "str=99999 14gb aaasd as 9999aad"
call find_number %number% "%str%"
echo Ergebnis "%number%"
set number=number
set "str=adadas9192391"
call find_number %number% "%str%"
echo Ergebnis "%number%"
set number=number
set "str=012345678923133945238475398453496369635q37593"
call find_number %number% "%str%"
echo Ergebnis "%number%"

set number=number
set "str=Hallo 123141 14gb aaasd as 9999aad"
call find_all_numbers %number% "%str%"
echo Ergebnis "%number%"
set number=number
set "str=99999 14gb aaasd as 9999aad"
call find_all_numbers %number% "%str%"
echo Ergebnis "%number%"
set number=number
set "str=adadas9192391"
call find_all_numbers %number% "%str%"
echo Ergebnis "%number%"
set number=number
set "str=012345678923133945238475398453496369635q37593"
call find_all_numbers %number% "%str%"
echo Ergebnis "%number%"