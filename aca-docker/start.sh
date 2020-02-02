#!/bin/bash
#first argument should be name of docker image to run
path=$(pwd)
sudo docker run -it --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" --volume="${path}/files:/home" ${1}
