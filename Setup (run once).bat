@echo off
cd /d "%~dp0"
echo Installing the council. This takes a few minutes, once only.
call uv sync
cd frontend
call npm.cmd install
echo.
echo Done. From now on, double-click "Start Council.bat".
pause
