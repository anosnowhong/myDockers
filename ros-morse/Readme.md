## ros-morse-cpu

[![](https://images.microbadger.com/badges/image/anosnowhong/ros-morse-cpu.svg)](https://microbadger.com/images/anosnowhong/ros-morse-cpu)
[![](https://images.microbadger.com/badges/version/anosnowhong/ros-morse-cpu.svg)](https://microbadger.com/images/anosnowhong/ros-morse-cpu)

This docker container is based on `ros:kinetic-robot`, include morse and cpu based opengl for graphics visualization.

## Run
Enter the container with the following command:

**Linux:**
```
docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix anosnowhong/ros-morse-cpu 
```

**OS X**
make sure XQuartz is installed, and allowed connection from client, more info [here](https://hub.docker.com/r/kayvan/scidvspc/)

```
```
