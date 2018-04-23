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
    graphviz \
    git \
    make \
    wget \
    g++ \
    libpq-dev \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

RUN wget -O mecab-0.996.tar.gz "https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7cENtOXlicTFaRUE" \
    && tar xzf mecab-0.996.tar.gz \
    && cd /tmp/mecab-0.996 \
    && ./configure && make && make install \
    && rm -rf /tmp/* \
    && ldconfig

RUN wget -O mecab-ipadic-2.7.0-20070801.tar.gz "https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7MWVlSDBCSXZMTXM" \
    && tar xzf mecab-ipadic-2.7.0-20070801.tar.gz \
    && cd mecab-ipadic-2.7.0-20070801 \
    && ./configure --with-charset=utf8 && make && make install \
    && rm -rf /tmp/*

#  App
#-----------------------------------------------
WORKDIR /app

COPY requirements.txt ./

RUN pip install -r requirements.txt

USER $NB_USER

CMD jupyter-notebook
