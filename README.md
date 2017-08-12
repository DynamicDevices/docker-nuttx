# docker-nuttx

Docker image with all you need to build Nuttx

## Install Dependencies

   $ sudo apt-get install docker.io

## Clone this repository

    $ cd ~
    $ git clone https://github.com/DynamicDevices/docker-nuttx.git

## Build the Docker image

    $ cd ~/docker-nuttx
    $ sudo docker build .
    ...
    Successfully built 0e2004ec1e03

## Run the docker image

Take the hex number shown as the outpu for the built image and run

    $ sudo docker run -it 0e2004ec1e03

This will drop you to a prompt within the Docker container running as user 'build'

    build@0e2004ec1e03:~$
