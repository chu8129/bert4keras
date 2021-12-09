FROM nvidia/cuda:11.0-base
LABEL version="base"

RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN sed -i s@http://deb.debian.org@http://mirrors.aliyun.com@g /etc/apt/sources.list
RUN apt-get clean
RUN apt-get update

RUN apt-get install -y software-properties-common gcc && add-apt-repository -y ppa:deadsnakes/ppa
RUN apt-get update
RUN apt-get install -y python3.6 python3-distutils python3-pip python3-apt
RUN ln -s $(which python3) /usr/local/bin/python
RUN apt install -y python3-pip

RUN pip config set global.index-url https://pypi.douban.com/simple/
RUN python -m pip install --upgrade pip 

RUN pip install Keras==2.3.1
RUN pip install bert4keras==0.10.8
RUN pip install tensorflow==2.4.0
