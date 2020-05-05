@echo off

REM go to the dir of this script
cd /D "%~dp0"

docker build .

REM get the image id of the image just built
FOR /F "delims=" %%A IN ('docker images --format "{{.ID}}"') DO (
    SET last=%%A
    GOTO :break
)
:break

SET DEV_CONSOLE_DIR=%~dp0
for %%I in ("%DEV_CONSOLE_DIR%..") do set "NETSPEAK_DIR=%%~fI"

REM start the container
docker kill dev-console
docker rm dev-console
docker run --rm -it --entrypoint /bin/bash --name=dev-console -v %NETSPEAK_DIR%:/netspeak4 %last%
