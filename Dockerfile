FROM python:3.9 AS builder
WORKDIR /app
COPY ./requirements.txt /app
RUN pip install --no-cache -r requirements.txt

FROM python:3.9-slim
WORKDIR /app
COPY --from=builder /usr/local/lib/python3.9/site-packages/ /usr/local/lib/python3.9/site-packages/
COPY . /app
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    default-libmysqlclient-dev \
    pkg-config \
    libmariadb3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
CMD [ "python" , "app.py" ]