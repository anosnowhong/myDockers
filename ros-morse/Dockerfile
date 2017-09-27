FROM ros:kinetic-robot

RUN apt-get update && apt-get install -y \
python3-pip \
&& pip3 install setuptools pyyaml catkin_pkg rospkg \
&& rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
git \
&& git clone https://github.com/morse-simulator/morse.git /root/morse \
&& mkdir /root/morse/build && cd /root/morse/build \
&& cmake ..&& make install \
&& cd / && rm -rf /root/morse \
&& apt-get purge git

COPY . /root
RUN apt-get update && apt-get install -y \
wget \
tar \ 
&& wget -P /tmp http://download.blender.org/release/Blender2.78/blender-2.78c-linux-glibc219-x86_64.tar.bz2 \
&& tar -xvf /tmp/blender-2.78c-linux-glibc219-x86_64.tar.bz2 -C /root\
&& rm -rf /tmp/blender-2.78c-linux-glibc219-x86_64.tar.bz2 \
&& apt-get purge wget tar

ENV LD_LIBRARY_PATH=/root/libgl-xlib
ENV MORSE_BLENDER=/root/blender-2.78c-linux-glibc219-x86_64/blender
