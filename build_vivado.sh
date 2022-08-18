#! /bin/bash

DOCKER_BUILDKIT=1 docker build -f Dockerfile_vivado --rm -t davboot01/xilinx_vivado:2020.1 --build-arg XILINX_INSTALL_FILE=install_config_vivado.txt . 
