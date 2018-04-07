FROM ubuntu:14.04

RUN apt-get update && apt-get install -y software-properties-common \

&& add-apt-repository ppa:v-launchpad-jochen-sprickerhof-de/pcl -y 

RUN apt-get install -y python-pip \
python-dev \
&& pip install cython==0.25.2 \
&& pip install numpy

RUN apt-get update && apt-get install -y libpcl-all 
