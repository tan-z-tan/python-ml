FROM python:3.6.0-slim
MAINTAINER tanji.makoto@gmail.com

RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential \
  emacs \
  git \
  wget

RUN rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

WORKDIR /app
COPY requirements.txt /app/

RUN pip install -r requirements.txt
