# Dockerfile
FROM python:3.10-slim

WORKDIR /app
COPY test.py .

CMD ["python", "test.py"]
