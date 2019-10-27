#!/bin/bash
path=$(pwd)
sudo docker run -it --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" --volume="${path}/files:/home" computationalaerodynamicssandbox_aca
