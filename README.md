# Jupyterで触れながら学ぶ機械学習速習会


## Setup

#### Prerequisites
If necessary, install docker.
https://docs.docker.com/docker-for-mac/

#### Clone this repogitory
`git clone git@github.com:tan-z-tan/python-ml.git`

`cd python-ml.git`

#### Pull Docker image
`docker pull tanztan/python-ml`

#### Run docker
```
docker run -v `pwd`:/home/jovyan/work -p 8888:8888 -it tanztan/python-ml
```

### (Optional)
If you could not setup your environment, you maybe use https://try.jupyter.org/ as your Jupyter env.
