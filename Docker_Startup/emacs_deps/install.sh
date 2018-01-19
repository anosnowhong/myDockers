!#/bin/bash
# format c++ project
apt install clang-format

# flycheck
apt install clang

# rtags needed
apt install clang \
  libclang-dev

#TODO: mkdir failed?
cd ~/.spacemacs.d/rtags && mkdir docker-build && cd docker-build
#TODO: make install permission?
cmake .. && make && make install

# build ycmd clang support
cd ~/.spacemacs.d/ycmd && ./build.py --clang-completer

