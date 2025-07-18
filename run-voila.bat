@echo off
REM Change into the script’s directory
cd /d "%~dp0"

REM Start the stack in detached mode
docker-compose up -d

REM Give it a few seconds to spin up
timeout /t 5 /nobreak >nul

REM Open the web UI in the default browser
start http://localhost:8866/

echo Voilà is now running. Press any key to exit this window.
pause >nul