#!/bin/bash
ROOT=`pwd`
echo $ROOT
# docker
IMAGE_NAME='botao1998/blog'
IMAGE_TAG='latest'
docker build --network=host -t $IMAGE_NAME:$IMAGE_TAG ./