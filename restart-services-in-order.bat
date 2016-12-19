@echo off
:stop
sc stop NameService01
rem Wait ~20 seconds to STOP next service
ping 127.0.0.1 -n 20 -w 1000 > nul

sc stop NameService02
rem Wait ~20 seconds to STOP next service
ping 127.0.0.1 -n 20 -w 1000 > nul

sc stop NameService03
rem Wait ~20 seconds to STOP next service
ping 127.0.0.1 -n 20 -w 1000 > nul

sc query NameService01 | sc query NameService02 | sc query NameService03 | find /I "STATE" | find "STOPPED"
if errorlevel 1 goto :stop
goto :start

:start
net start | find /i "NameService01" && "NameService02" && "NameService03">nul && goto :start

sc start NameService01
rem Wait ~20 seconds to STOP next service
ping 127.0.0.1 -n 20 -w 1000 > nul

sc start NameService02
rem Wait ~20 seconds to STOP next service
ping 127.0.0.1 -n 20 -w 1000 > nul

sc start NameService03
rem Wait ~20 seconds to STOP next service
ping 127.0.0.1 -n 20 -w 1000 > nul
