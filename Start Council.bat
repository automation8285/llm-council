@echo off
cd /d "%~dp0"
if not exist ".env" (
  echo The key file .env is missing. See RAKESH-GUIDE.md, step 3.
  pause
  exit /b
)
start "Council engine - keep open" cmd /k uv run python -m backend.main
start "Council screen - keep open" /d "%~dp0frontend" cmd /k npm.cmd run dev
timeout /t 8 /nobreak >nul
start "" http://localhost:5173
