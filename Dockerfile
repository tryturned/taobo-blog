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
# RUN apk update && \
#    apk add --no-cache gcc g++ musl-dev git

# 安装hugo
# https://github.com/gohugoio/hugo#fetch-from-github
COPY hugo/ /root/hugo/
RUN cd /root/hugo \
    && go install \
    && cd /root/ \
    && rm -fr hugo

# 执行文件
WORKDIR /data/release
COPY . ./
RUN rm -fr hugo
CMD hugo server -v -w -p 80 -b http://taobo.site  --bind 0.0.0.0
# CMD hugo server -v -w -p 1313 -b http://127.0.0.1/  --bind 0.0.0.0
