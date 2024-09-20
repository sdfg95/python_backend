.PHONY: all install run tests

APP_NAME = app.lecture_1:app
HOST = localhost
PORT = 8000

install:
	@echo "Installing requirements..."
	pip install -r requirements.txt

run:
	@echo "Starting ASGI application..."
	uvicorn $(APP_NAME) --host $(HOST) --port $(PORT) &

tests:
	@echo "Running tests..."
	pytest tests/test_homework_1.py


wait-for-server:
	@echo "Waiting for the server to start..."
	@until curl -s "http://$(HOST):$(PORT)" >/dev/null; do sleep 1; done

all: install run wait-for-server tests
