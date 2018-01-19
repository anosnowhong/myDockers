FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
      libboost1.58-all-dev \
      libflann-dev \
      libeigen3-dev \
      libvtk6-dev \
      libvtk6-qt-dev \
      cmake \
      libproj-dev \
      libgtk2.0-dev \
      python-dev \
      python-numpy \
      libtbb2 \
      libtbb-dev \
      libdc1394-22-dev

&& pip3 install setuptools pyyaml catkin_pkg rospkg \
&& rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
git --no-install-recommends \
&& git clone https://github.com/morse-simulator/morse.git /root/morse \
&& mkdir /root/morse/build && cd /root/morse/build \
&& cmake ..&& make install \
&& cd / && rm -rf /root/morse \
&& apt-get purge git -y \
&& rm -rf /var/lib/apt/lists/*

COPY . /root
RUN apt-get update && apt-get install -y \
wget --no-install-recommends\ 
&& wget -P /tmp http://download.blender.org/release/Blender2.78/blender-2.78c-linux-glibc219-x86_64.tar.bz2 \
&& tar -xf /tmp/blender-2.78c-linux-glibc219-x86_64.tar.bz2 -C /root\
&& rm -rf /tmp/blender-2.78c-linux-glibc219-x86_64.tar.bz2 \
&& apt-get purge wget -y \
&& rm -rf /var/lib/apt/lists/*

ENV LD_LIBRARY_PATH=/root/libgl-xlib
ENV MORSE_BLENDER=/root/blender-2.78c-linux-glibc219-x86_64/blender
