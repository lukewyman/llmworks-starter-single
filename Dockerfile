FROM python:3.12-slim
WORKDIR /app
COPY pyproject.toml ./
RUN pip install --no-cache-dir "fastapi>=0.111" "uvicorn>=0.30"
COPY src ./src
EXPOSE 8080
CMD ["uvicorn", "llmworks_starter.main:app", "--host", "0.0.0.0", "--port", "8080"]
