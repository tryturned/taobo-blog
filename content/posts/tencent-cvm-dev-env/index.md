---
weight: 4
title: "基于腾讯云cvm的云原生环境搭建"
date: 2021-12-14T23:57:40+08:00
lastmod: 2022-01-11T16:45:40+08:00
draft: false
author: "神仙404"
authorLink: "https://blog.csdn.net/qq_41345173/article/details/121454774"
description: "基于腾讯云cvm的云原生环境搭建."
tags: ["计算机"]
categories: ["开发环境"]

images: ["cloud-native.png"]
resources:
- name: "featured-image"
  src: "cloud-native.png"
---

本文使用的是操作系统为TencentOS Server 3.1的腾讯云CVM
<!--more-->

所有的操作均基于腾讯云服务器，具体配置如下，操作系统为TencentOS Server 3.1

```bash
[root@VM-0-16-centos ~]$ lsb_release -a
LSB Version:    :core-4.1-amd64:core-4.1-noarch
Distributor ID: CentOS
Description:    CentOS Linux release 8.4.2105 (Core) 
Release:        8.4.2105
Codename:       Core
[root@VM-0-16-centos cms]$ cat /etc/motd
Welcome to TencentOS 3 64bit
Version 3.1 20210604
tlinux3.1-64bit-5.4.119-19.0006-20210623
```

## 一、安装vim

主要是更新vim的版本，使其>8.0,这样某些插件才可以正常安装。

```bash
yum remove vim vi
rm -fr /usr/local/vim /usr/bin/vim
cd /tmp
wget https://github.com/vim/vim/archive/v8.2.0000.tar.gz 
tar xzf  v8.2.0000.tar.gz 
cd vim-8.2.0000/
./configure --prefix=/usr/local/vim  --with-features=huge --enable-multibyte --enable-gtk3-check  --enable-rubyinterp=yes --with-python3-command=python3 --enable-python3interp=yes --enable-perlinterp=yes --enable-luainterp=yes --enable-cscope 
make && make install
ln -s /usr/local/vim/bin/vim  /usr/bin/vim
vim --version #验证是否安装成功
```

### 快速安装基本插件

```bash
cd ~
git clone git@codechina.csdn.net:qq_41345173/tvim.git
cd tvim
cp .vimrc ~/.vimrc
mkdir -p ~/.vim/
cp -r colors/ ~/.vim/
cp -r autoload/ ~/.vim/
cp -r plugged/ ~/.vim/
cd ~/.vim/plugged
unzip plugged.zip
cd ~
rm -fr tvim
```

相关文章：
<https://blog.csdn.net/qq_41345173/article/details/120381818>

## 二、tlinux3安装docker

Tlinux3和其他原生操作系统不同，有团队维护tlinux源，安装docker-ce的方式如下：

```bash
yum install tencentos-release-docker-ce
yum update
yum install docker-ce docker-ce-cli containerd.io
# 测试
docker version
```

配置github相关域名的ip地址，以进行加速访问github资源：

```bash
vim /etc/hosts
# 尾部添加如下内容
# 在网站https://www.ipaddress.com/获取最新ip
140.82.113.3 github.com
185.199.108.133 raw.githubusercontent.com
185.199.109.133 raw.githubusercontent.com
185.199.110.133 raw.githubusercontent.com
185.199.111.133 raw.githubusercontent.com
```

Docker-compose安装：

```bash
curl -LO "https://github.com/docker/compose/releases/download/1.29.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

## 三、安装golang

安装golang

```bash
wget https://dl.google.com/go/go1.16.linux-amd64.tar.gz
sha256sum go1.16.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.16.linux-amd64.tar.gz
# 设置环境变量，在~/.bashrc中添加如下配置
export PATH=$PATH:/usr/local/go/bin
export GO111MODULE=on
export GOPROXY=https://goproxy.cn,direct
export GOSUMDB=off
export GOPATH=/root/go
export PATH=$PATH:$GOPATH/bin
```

安装proto依赖，便于进行RPC开发

```bash
git clone https://github.com/protocolbuffers/protobuf
# v3.6.0+以上版本支持map解析，syntax=2、3消息序列化后是二进制兼容的，用root执行以下命令
cd protobuf
./autogen.sh
./configure
make
make install
ldconfig
protoc --version # 检测是否安装成功
go get github.com/golang/protobuf # 安装依赖包
# 安装gprc protocol插件
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
# 安装grpc-gateway插件
go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@latest
go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2@latest
```

## 四、安装nginx

通过以下命令安装和启动nginx:

```bash
yum install nginx
systemctl start nginx
# nginx默认监听端口为80，安装后可以通过/etc/nginx/nginx.conf配置文件修改监听的端口
# systemctl reload nginx可以一键重启nginx服务
```
