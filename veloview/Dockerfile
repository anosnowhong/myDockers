FROM ubuntu:14.04

#RUN apt-get update && apt-get install -y \
#python3-pip \
#&& pip3 install setuptools pyyaml catkin_pkg rospkg \
#&& rm -rf /var/lib/apt/lists/*

# install higher version of cmake
RUN apt-get update && apt-get install -y wget \
&& cd /usr \
&& wget https://cmake.org/files/v3.5/cmake-3.5.2-Linux-x86_64.tar.gz \
&& tar -xzC /usr \
&& rm -rf cmake-3.5.2-Linux-x86_64.tar.gz

# veloview dependencies
RUN apt-get update && apt-get install -y \
cmake-curses-gui \
build-essential \
libboost-all-dev \
libxt-dev \
libbz2-dev \
libqt4-dev \
qt4-default \
qt4-dev-tools \
zlib1g-dev \
# lex and yacc for pcap
flex \
byacc \
# pcl dependencies
libflann-dev \
libeigen3-dev \
&& rm -rf /var/lib/apt/lists/*

# veloview, pcl and pcl plugin for paraview
RUN apt-get update && apt-get install -y \
git --no-install-recommends \
&& git clone https://github.com/Kitware/VeloView  /root/veloview \
# build veloview
&& mkdir /root/build-veloview && cd /root/build-veloview \
&& cmake -DENABLE_veloview:BOOL=ON \
-DENALBE_boost:BOOL=ON \
-DENABLE_python:BOOL=ON \
-DUSE_SYSTEM_boost:BOOL=ON \
-DUSE_SYSTEM_python:BOOL=ON \
-DUSE_SYSTEM_qt:BOOL=ON \
../veloview/Superbuild \
&& make

# build pcl (pcl is just function as a plugin so the only common part is using same version of vtk)
&& cd /root/veloview
&& git clone https://github.com/PointCloudLibrary/pcl /root/veloview/pcl \
# add new link to vtk library for pcl to link successfully
&& find ./ -type f -name "*-pv5.1*" |while read FILE; do newfile="$(echo ${FILE} | sed -e 's/-pv5.1.so.1/.so/g')"; ln -s ${FILE} ${newfile}; done
&& mkdir /root/veloview/pcl/build
&& cd /root/veloview/pcl/build
&& cmake -DCMAKE_CXX_FLAGS:str=-L/root/build-veloview/install/lib \
#-DEIGEN_INCLUDE_DIR:str=/root/build-veloview/install/include #for eigen header
-DVTK_DIR:str=/root/build-veloview/paraview/src/paraview-build/VTK
-DBUILD_tools:BOOL=OFF # cause paraview built vtk seems didn't build a module vtkImageViewer2.h

# build pcl plugin
&& cd /root/veloview \
&& git clone https://github.com/Kitware/PCLPlugin /root/veloview/PCLPlugin \
&& mkdir /root/veloview/PCLPlugin/build \
&& cd /root/veloview/PCLPlugin/build \
&& make

&& apt-get purge git -y \
&& rm -rf /var/lib/apt/lists/*
