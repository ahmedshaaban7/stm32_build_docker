
# docker build -t stm32_tools:v1 -f Dockerfile .

# docker run --rm -it --privileged -v "$PWD:/home/stm32_workspace" stm32_tools:v1 bash

# cd STM32_Project
# docker run --rm --privileged -v "$PWD:/home/stm32_workspace" stm32_tools:v1  /bin/bash -c "cmake -B Debug && cmake --build Debug"
# docker run --rm --privileged -v "$PWD:/home/stm32_workspace" stm32_tools:v1 cmake --build Debug --target clean

# docker image tag stm32_tools:v1 ahmedshaaban7/stm32_tools:v1
# docker login
# docker push ahmedshaaban7/stm32_tools:v1

FROM ubuntu:24.04

RUN apt-get update
RUN apt-get clean 
RUN apt-get install -y wget make gcc g++ git

WORKDIR /home/stm32_pkg

# adding to the image the contents of the directory where Dockerfile is
ADD . /home/stm32_pkg    

# extract archive files, files must be in the same directory as Dockerfile
RUN tar -xzvf cmake.tar.gz 
RUN tar -xzvf arm-none-eabi-gcc.tar.gz 

# remove archive files
RUN rm cmake.tar.gz
RUN rm arm-none-eabi-gcc.tar.gz

# add cmake and arm-none-eabi-gcc to compiler
ENV PATH="/home/stm32_pkg/cmake/bin:$PATH"
ENV PATH="/home/stm32_pkg/arm-none-eabi-gcc/arm-none-eabi/bin:/home/stm32_pkg/arm-none-eabi-gcc/bin:$PATH"

WORKDIR /home/stm32_workspace
