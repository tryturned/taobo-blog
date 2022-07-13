## quickstart

```bash
    cd /tmp
    curl -fLO https://github.com/gohugoio/hugo/releases/download/v0.98.0/hugo_extended_0.98.0_Linux-64bit.tar.gz
    tar -xzvf hugo_extended_0.98.0_Linux-64bit.tar.gz
    mv hugo /usr/local/bin
    git clone https://github.com/tryturned/taobo-blog.git
    cd taobo-blog
    git submodule update --init
    hugo server -e production 
```

## 参考博客

- [LoveIt官方文档: 主题文档 - 基本概念](https://hugoloveit.com/zh-cn/theme-documentation-basics)

- 【雨临Lewis】<https://lewky.cn/posts/hugo-3.html/>

- 【Hugo 中的 ref 和 relref】<https://www.thisfaner.com/p/ref-relref-in-hugo/>