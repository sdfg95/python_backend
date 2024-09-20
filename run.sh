#!/bin/bash

pip install -r requirements.txt

uvicorn app.lecture_1:app --host localhost --port 8000 &

UVICORN_PID=$!
sleep 1

pytest tests/test_homework_1.py

kill $UVICORN_PID
