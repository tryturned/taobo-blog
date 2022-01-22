---
date: '2007-11-04'
title: 《Windows核心编程》学习笔记系列
categories:
- 测试
url: /test1
tags:
- markdown
thumbnailImagePosition: left
thumbnailImage: //d1u9biwaxjngwg.cloudfront.net/elements-showcase/vintage-140.jpg
---

因此我也不能错过这么一本好书，最近也一直在学习Windows相关的知识，而这本书犹如指路明灯。

<!--more-->

# 因此我打算把学习过程中的一些心得体会，知识的积累写下来。下面是本系列大体的目录结构：

## 1.《Windows核心编程》学习笔记系列-Windows服务

## 2.《Windows核心编程》学习笔记系列-线程与进程

## 3.《Windows核心编程》学习笔记系列-内存管理

```cpp
    // vector::pop_back
    #include <iostream>
    #include <vector>

    int main ()
    {
    std::vector<int> myvector;
    int sum (0);
    myvector.push_back (100);
    myvector.push_back (200);
    myvector.push_back (300);

    while (!myvector.empty())
    {
        sum+=myvector.back();
        myvector.pop_back();
    }

    std::cout << "The elements of myvector add up to " << sum << '\n';

    return 0;
    }
```