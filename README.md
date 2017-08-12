
# docker-nuttx

Docker image with all you need to build Nuttx

## Install Dependencies

    sudo apt-get install docker.io

## Clone this repository

    cd ~
    git clone https://github.com/DynamicDevices/docker-nuttx.git

## Build the Docker image

    cd ~/docker-nuttx
    sudo docker build .
    ...
    Successfully built 0e2004ec1e03

## Run the docker image

Take the hex number shown as the outpu for the built image and run

    sudo docker run -it 0e2004ec1e03

This will drop you to a prompt within the Docker container running as user 'build'

    build@0e2004ec1e03:~$

## Example: Building for STM32F4-Discovery board

This is taken from the Ubuntu build notes here

http://reclonelabs.com/building-nuttx-in-ubuntu-from-scratch/

### Preconfigure NuttX to build for the STM32F4-Discovery board, with NuttShell (NSH) on UART2:

    cd ~/nuttx/tools
    ./configure.sh stm32f4discovery/nsh

## Configure the toolchain for ARM Cortex-M4F, and launch menuconfig

    cd ~/nuttx/misc/buildroot
    cp configs/cortexm4f-eabi-defconfig-4.7.4 .config
    make menuconfig

- Change the Toolchain Options to set the GCC version to 4.9.3
- Change the Build Options to set $(TOPDIR) to ~/nuttx
- Save the new Buildroot configuration

### Make the NuttX buildroot 

    make

NOTE: I have built and pushed a build of the build root to https://hub.docker.com/r/dynamicdevices/nuttx

To pull use

    sudo docker pull  dynamicdevices/nuttx:toolchain_build_arm_hf

To run use

    sudo docker run -it dynamicdevices/nuttx:toolchain_build_arm_hf

