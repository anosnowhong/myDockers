FROM ros:kinetic-robot

RUN apt-get update && apt-get install -y 
python3-pip \
git \
--no-install-recommends \
&& pip3 install pyyaml catkin_pkg rospkg \
&& rm -rf /var/lib/apt/lists/*

