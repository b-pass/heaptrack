FROM ubuntu:latest

RUN apt-get update && apt-get -y upgrade && apt-get -y install sudo vim git cmake make clang zlib1g-dev elfutils libc-dev libunwind-dev libboost-dev libboost-iostreams-dev libboost-program-options-dev libboost-system-dev libboost-filesystem-dev libdw-dev libdwarf-dev libelf-dev

COPY . /heaptrack

RUN mkdir -p /heaptrack/build
WORKDIR /heaptrack/build

RUN cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo -DBUILD_SHARED_LIBS=OFF
RUN make -j4 heaptrack_interpret

