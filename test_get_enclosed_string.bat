@echo off
set sub=sub
set "string=(Hallo Welt)"
set "start=("
set "end=)"
call get_enclosed_string %sub% "%string%" "%start%" "%end%"
echo Search: "%string%"
echo The enclosed String is "%sub%"



set sub=sub
set "string=((Hallo Welt))"
set "start=("
set "end=)"
call get_enclosed_string %sub% "%string%" "%start%" "%end%"
echo Search: "%string%"
echo The enclosed String is "%sub%"


set sub=sub
set "string=((Hallo Welt))"
set "start=(("
set "end=)"
call get_enclosed_string %sub% "%string%" "%start%" "%end%"
echo Search: "%string%"
echo The enclosed String is "%sub%"


set sub=sub
set "string=((Hallo Welt))"
set "start=("
set "end=))"
call get_enclosed_string %sub% "%string%" "%start%" "%end%"
echo Search: "%string%"
echo The enclosed String is "%sub%"


set sub=sub
set "string=((Hallo Welt))"
set "start=(("
set "end=))"
call get_enclosed_string %sub% "%string%" "%start%" "%end%"
echo Search: "%string%"
echo The enclosed String is "%sub%"

set sub=sub
set "string=<start>Hallo Welt<///end//<yx>"
set "start=<start>"
set "end=<///end//<yx>"
call get_enclosed_string %sub% "%string%" "%start%" "%end%"
echo Search: "%string%"
echo The enclosed String is "%sub%"

set sub=sub
set "string=ada s da <start>Hallo Welt<///end//<yx>ada da g sdfg"
set "start=<start>"
set "end=<///end//<yx>"
call get_enclosed_string %sub% "%string%" "%start%" "%end%"
echo Search: "%string%"
echo The enclosed String is "%sub%"
