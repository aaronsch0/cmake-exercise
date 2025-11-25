FROM ubuntu:24.04
RUN sed -i 's|http://ports.ubuntu.com/ubuntu-ports|http://mirrors.edge.kernel.org/ubuntu|g' /etc/apt/sources.list
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential cmake git wget unzip \
    libdeal.ii-dev libboost-all-dev libopenmpi-dev

WORKDIR /tmp
RUN wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.zip && \
    unzip yaml-cpp-0.6.3.zip && \
    cd yaml-cpp-yaml-cpp-0.6.3 && \
    mkdir build && cd build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release && \
    make -j$(nproc) && make install

    
ENV LD_LIBRARY_PATH=/usr/local/lib


WORKDIR /cmake-exercise
COPY . /cmake-exercise

CMD ["/bin/bash"]
