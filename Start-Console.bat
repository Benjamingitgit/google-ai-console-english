@echo off
chcp 65001 >nul
cd /d "%~dp0"
if not exist .venv\Scripts\python.exe (
  python -m venv .venv
  if errorlevel 1 goto fail
  .venv\Scripts\python.exe -m pip install -r requirements.txt
  if errorlevel 1 goto fail
)
echo Open http://127.0.0.1:18765 in Chrome. Keep this window open.
.venv\Scripts\python.exe -m uvicorn app:app --host 127.0.0.1 --port 18765
:fail
pause
