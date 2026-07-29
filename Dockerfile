FROM python:3.12-slim

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV secret_key="OMG I FINISHED MY A LEVELS WHOO"
ENV database_uri="postgresql+psycopg2://postgres:postgres@postgres_db:5432/mydb"
ENV master_username="MASTER"
ENV master_password="MASTER"

EXPOSE 5000

CMD ["python", "main.py"]
