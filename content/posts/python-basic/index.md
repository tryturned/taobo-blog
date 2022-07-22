---
weight: 4
title: "Python基础学习"
date: 2020-09-21T13:57:40+08:00
lastmod: 2020-01-11T16:45:40+08:00
draft: false
author: "taobo"
authorLink: "https://blog.csdn.net/qq_41345173/"
tags: ["python-dev"]
categories: ["Python"]
---

Linux 环境下的 Python 开发基础教程.
<!--more-->

## 一、开发环境搭建

### 1.安装依赖库

```bash  
yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel libffi-devel
```

### 2.下载安装包

```bash
# wget下载安装包并解压至 /usr/local/python3
wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tgz
tar -C /usr/local -xzvf Python-3.7.0.tgz
cd /usr/local/Python-3.7.0
```

### 3.配置与安装

{{< typeit group=paragraph >}}
./configure --prefix=/usr/local/python3
{{< /typeit >}}
{{< typeit group=paragraph >}}
make && make install
{{< /typeit >}}

```bash
# 上面的参数，--prefix 是预期安装目录，--enable-optimizations 是优化选项（LTO，PGO 等）加上这个 flag 编译后，性能有 10% 左右的优化，但是这会明显的增加编译时间。  
# 安装成功会提示如下消息:    
Collecting setuptools  
Collecting pip  
Installing collected packages: setuptools, pip  
Successfully installed pip-10.0.1 setuptools-39.0.1 
```

### 4.创建软链接

```bash
ln -s /usr/local/python3/bin/python3.7 /usr/local/bin/python3
ln -s /usr/local/python3/bin/pip3.7 /usr/local/bin/pip3
```

### 5.正确使用 vim 编写第一个python程序

首先在 ~/.vimrc 配置 python 缩进：`autocmd FileType python set tabstop=4 | set expandtab | set autoindent`  
示例程序：  

```python
#!/usr/local/bin/python3
# -*- coding:utf-8 -*-
for x in range(20):
    if x % 2 == 0:
        print(x)
```

### 6.可变对象与不可变对象

- 可变对象：list dict set
- 不可变对象：tuple string int float bool  
- [可变对象与不可变对象比较](https://zhuanlan.zhihu.com/p/34395671)  
