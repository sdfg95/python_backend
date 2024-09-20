@echo off

pip install -r requirements.txt

start /B python -m uvicorn app.lecture_1:app --host localhost --port 8000

timeout /t 1

pytest tests/test_homework_1

taskkill /f /im python.exe

pause
