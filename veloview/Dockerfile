FROM ubuntu:14.04
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
# vtk head for pcl
libvtk6-dev \
# to get binary cmake 3.5
#curl \
&& rm -rf /var/lib/apt/lists/*
#RUN curl -sS https://cmake.org/files/v3.5/cmake-3.5.2-Linux-x86_64.tar.gz | tar -xzC /usr
RUN cd /usr \
&& apt-get update && apt-get install -y \
git \
wget \
--no-install-recommends \
&& wget https://cmake.org/files/v3.5/cmake-3.5.2-Linux-x86_64.tar.gz --no-check-certificate \
&& tar -xzf cmake-3.5.2-Linux-x86_64.tar.gz --strip=1 \
&& rm -rf /var/lib/apt/lists/*

# veloview, pcl and pcl plugin for paraview
 
RUN git clone http://github.com/Kitware/VeloView  /root/veloview \
# build veloview
&& mkdir /root/build-veloview && cd /root/build-veloview \
&& cmake -DENABLE_veloview:BOOL=ON \
-DUSE_SYSTEM_boost:BOOL=ON \
-DUSE_SYSTEM_python:BOOL=ON \
-DUSE_SYSTEM_qt:BOOL=ON \
# install vtk headers and others
#-DPARAVIEW_INSTALL_DEVELOPMENT_FILES:BOOL=ON \
../veloview/Superbuild \
&& make -j $(nproc) \
#&& make install \
# add new link to vtk library for pcl to link successfully
&& cd /root/build-veloview/install/lib/paraview-5.1/ \
&& find ./ -type f -name "*-pv5.1*" |while read FILE; do newfile="$(echo ${FILE} | sed -e 's/-pv5.1.so.1/.so/g')"; ln -s ${FILE} ${newfile}; done 
# && cd /root/build-veloview/install/include/paraview-5.1/ \
# && find ./ -type f -name "*PV*" |while read FILE; do newfile="$(echo ${FILE} | sed -e 's/PV//g')"; ln -s ${FILE} ${newfile}; done \
# Rebuild vtk standalone to install header file cause paraview installed has something wrong with Rending...(strange vtkPVLODActor header)
#&& cd /root/build-veloview/paraview/src/paraview-build/VTK \
#&& cmake ../../paraview/VTK \
#&& make -j $(nproc) \
#&& make install
# build pcl (pcl is just function as a plugin so the only common part is using same version of vtk)
RUN cd /root/build-veloview \
&& git clone https://github.com/PointCloudLibrary/pcl \
&& mkdir /root/build-veloview/pcl/build \
&& cd /root/build-veloview/pcl/build \
&& git checkout tags/pcl-1.8.1 \
&& cmake -DVTK_DIR:PATH=/root/build-veloview/paraview/src/paraview-build/VTK \
#-DCMAKE_CXX_FLAGS:STRING="-L/root/build-veloview/install/lib/paraview-5.1 -I/root/build-veloview/install/include/vtk-6.2" \
-DCMAKE_CXX_FLAGS:STRING="-L/root/build-veloview/install/lib/paraview-5.1 -I/usr/include/vtk-6.2" \
## cause paraview built vtk seems didn't build a module vtkImageViewer2.h
-DBUILD_tools:BOOL=OFF ..  \
##-DEIGEN_INCLUDE_DIR:str=/root/build-veloview/install/include #for eigen header
&& make -j $(nproc) 
## build pcl plugin
RUN cd /root/build-veloview \
&& git clone https://github.com/Kitware/PCLPlugin /root/build-veloview/PCLPlugin \
&& mkdir /root/build-veloview/PCLPlugin/build \
&& cd /root/build-veloview/PCLPlugin/build \
&& cmake -DPCL_DIR:STRING=/root/build-veloview/pcl/build -DParaView_DIR:STRING=/root/build-veloview/paraview/src/paraview-build ..\
&& make -j $(nproc)
