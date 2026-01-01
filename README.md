
### Prebuilt Docker Image hosted on Docker Hub

https://hub.docker.com/r/ahmedshaaban7/stm32_tools


### Included Software

| Software             | Version            |
|----------------------|-------------------|
| Base image: Ubuntu   | 24.04             |
| CMake                | 3.30.1            |
| arm-none-eabi-gcc    | 10.3.1 (20210824) |

## Usage

In the project directory, to build, run:

```bash
docker run --rm --privileged -v "$PWD:/home/stm32_workspace" stm32_tools:v1 /bin/bash -c "cmake -B Debug && cmake --build Debug"
```

To clean the project, run:

```bash
docker run --rm --privileged -v "$PWD:/home/stm32_workspace" stm32_tools:v1 cmake --build Debug --target clean
```
