#! /bin/bash

DOCKER_BUILDKIT=1 docker build -f Dockerfile_vitis --rm -t davboot01/ubuntu_vitis:2020.1 --build-arg XILINX_INSTALL_FILE=install_config_vitis.txt .
