FROM golang:1.16-alpine AS build

ARG CGO=1
ENV CGO_ENABLED=${CGO}
ENV GOOS=linux
ENV GO111MODULE=on
ENV GOPROXY=https://goproxy.cn,direct
ENV GOSUMDB=off
ENV GOPATH=/root/go
ENV PATH=$PATH:$GOPATH/bin

# gcc/g++ are required to build SASS libraries for extended version
RUN apk update && \
   apk add --no-cache gcc g++ musl-dev git

# 安装hugo
# https://github.com/gohugoio/hugo#fetch-from-github
RUN mkdir $HOME/src \
    && cd $HOME/src \
    && git clone https://github.com/gohugoio/hugo.git \
    && cd hugo \
    && go install

# ADD ./hugo /usr/local/bin/hugo
# RUN apk add --no-cache py-pygments ca-certificates
# RUN cd /tmp \
#    && tar -xf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz hugo \
#    && mv /tmp/hugo /usr/local/bin/hugo \
#    && rm -rf /tmp/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz

# 执行文件
WORKDIR /data/release
COPY . ./
CMD hugo server -v -w -p 1313 -b http://taobo.site  --bind 0.0.0.0
