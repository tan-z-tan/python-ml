FROM jupyter/base-notebook
MAINTAINER tanji.makoto@gmail.com

USER root
# Install all OS dependencies for fully functional notebook server
RUN apt-get update && apt-get install -yq --no-install-recommends \
    build-essential \
    python-dev \
    unzip \
    libsm6 \
    pandoc \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER $NB_USER

COPY requirements.txt ./

RUN pip install -r requirements.txt

CMD jupyter-notebook
