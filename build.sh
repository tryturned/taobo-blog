#!/bin/bash
ROOT=`pwd`
echo $ROOT
# docker
IMAGE_NAME='botao1998/blog'
IMAGE_TAG='v0.1'
docker build --network=host -t $IMAGE_NAME:$IMAGE_TAG ./
docker tag $IMAGE_NAME:$IMAGE_TAG $IMAGE_NAME:latest