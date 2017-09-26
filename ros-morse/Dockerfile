FROM ros:kinetic-robot

RUN apt-get update && apt-get install -y \
python3-pip \
wget \
tar \
git \
&& pip3 install setuptools pyyaml catkin_pkg rospkg \
&& rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/morse-simulator/morse.git ~/morse \
&& mkdir ~/morse/build && cd ~/morse/build \
&& cmake ..&& make install \
&& cd / && rm -rf ~/morse

COPY ./libgl-xlib ~
RUN wget -P /tmp http://download.blender.org/release/Blender2.78/blender-2.78c-linux-glibc219-x86_64.tar.bz2 \
&& tar -xvf /tmp/blender-2.78c-linux-glibc219-x86_64.tar.bz2 ~

ENV LD_LIBRARY_PATH=/root/libgl-xlib:$LD_LIBRARY_PATH
ENV MORSE_BLENDER=/root/blender-2.78c-linux-glibc219-x86_64/blender
