FROM ros:kinetic-robot

RUN apt-get update && apt-get install -y \
python3-pip \
git \
--no-install-recommends \
&& pip3 install setuptools pyyaml catkin_pkg rospkg \
&& rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/morse-simulator/morse.git ~/morse \
&& mkdir ~/morse/build && make install && cd / && rm -rf ~/morse
