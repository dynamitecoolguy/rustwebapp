@echo off
cd /d %~dp0

@setlocal enabledelayedexpansion

for /f "usebackq" %%i in (`wsl -- cat /etc/resolv.conf ^| grep nameserver ^| awk '{print $2}'`) do set WSL_HOST_IP=%%i

set OVERRIDE_FILE=compose.debug.yml
echo.services:>!OVERRIDE_FILE!
echo.  web-server:>>!OVERRIDE_FILE!
echo.    extra_hosts:>>!OVERRIDE_FILE!
echo.      - "api-server:%WSL_HOST_IP%">>!OVERRIDE_FILE!
