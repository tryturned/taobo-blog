---
weight: 4
title: "分布式系统设计模式"
date: 2022-07-22T20:27:40+08:00
lastmod: 2022-07-25T18:08:00+08:00
draft: false
author: "taobo"
authorLink: "https://taobo.site"
description: "本文主要介绍分布式系统中一些关键词的含义"
tags: ["分布式系统"]
categories: ["翻译"]
---
本文是对 [Nishant](https://medium.com/@nishantparmar) 文章 [Distributed System Design Patterns](https://medium.com/@nishantparmar/distributed-system-design-patterns-2d20908fecfc) 的翻译，主要介绍分布式系统相关设计问题中涉及到的关键模式。
<!--more-->

## Keys

### 1.布隆过滤器

[布隆过滤器](https://www.geeksforgeeks.org/bloom-filters-introduction-and-python-implementation/)是一个空间友好的概率数据结构，通常用来判断数据是否是集合中的一个元素，其通常用于我们需要知道某个元素是否属于某类对象的场景。具体应用见下图：  
{{< figure src="./Bloom_Filters.png" title="example" caption="example">}}  
在[BigTable](https://www.cnblogs.com/xybaby/p/9096748.html#_labelTop)，一个分布式数据存储系统中，任何读操作都需要读取构成Tablet的所有SSTables结构。当SSTables结构不在内存的时候，需要进行大量的磁盘io才能完成一个读请求，为了减少磁盘读写次数，BigTable使用了布隆过滤器。

### 2.一致性哈希

一致性哈希可以帮助开发者更加容易有效的扩展和复制数据，并且保证良好的可用性和容错能力。  
每个被`key`标识的数据项最终都会分配到一个节点，具体计算逻辑是，通过对数据项的`key`值进行hash可以计算出该`key`值在环上的位置，然后沿着哈希环顺时针行走，直到发现第一个比`key`值的位置大的节点，发现的这个节点就是将要分配给`key`标识的数据项的节点。示例：  
{{< figure src="./consistent_hashing.png" title="Consistent Hashing Ring" caption="Consistent Hashing Ring">}}  
一致性hash的主要优势是增量稳定性，集群中的节点删除和新增仅仅影响其相邻的节点，其他的节点不受影响。

### 3.Quorum

在分布式环境中，`quorum`指的是所有的分布式操作执行成功所需要的最小服务数目。
{{< figure src="./Quorum.png">}}  

[Cassanddra](https://zh.m.wikipedia.org/zh/Cassandra)(一个开源分布式NoSQL数据库系统)，为了确保数据一致性，可以配置对于每一个写请求只有当数据写入副本节点中至少一个`quorum`才算成功。

对于Leader选举，Chubby使用[Paxos](https://www.cnblogs.com/linbingdong/p/6253479.html)，它使用`quorum`来保证强一致性。Raft和Paxos共识算法学习参考资料：[Raft user study](https://ongardie.net/static/raft/userstudy/)。

[Dynamo](https://www.allthingsdistributed.com/2007/10/amazons_dynamo.html)复制写入数据到整个系统其他节点的一个quorum中，而不是像Paxos一样严格的大多数quorum中。系统的所有的读写操作都会被preference list上的第一个正常的节点执行，该节点不一定总是在遍历一致性哈希环是遇到的第一个节点。

### 4.Leader and Follower

为了确保数据管理系统的容错性，需要在集群内的多个服务器上复制数据。所以需要在该集群内选出一个服务作为`leader`, `leader`负责代表整个集群做出决策，并将决策传播到剩余的其他服务器，其他机器可以看作是`follower`。  
...  

### 5.心跳

心跳机制用于检测现有的leader服务状态，如果不正常的话需要开始新的leader选举。

### 6.Fencing

### 7.预写日志

### 8.Segmented Log

### 9.High-Water mark

### 10.Lease

### 11.Gossip Protocol

### 12.Phi Accrual Failure Detection

### 13.Split-brain

### 14. Checksum

### 15.CAP Theorem

CAP定理指出，分布式系统不可能同时具有以下三个属性：

- 一致性，Consistency (C)
- 可用性，Availability (A)
- 分区容错性，Partition Tolerance(P)

根据CAP定理，任何分布式系统都需要满足三个属性中的两个。这三个选项是 CA、CP 和 AP。

[Dynamo](https://www.cnblogs.com/xybaby/p/13944662.html)：该分布式系统属于CAP理论模型中的AP系统，旨在以牺牲强一致性为代价实现高可用性。

[BigTable](https://www.cnblogs.com/xybaby/p/9096748.html)：该分布式系统属于CAP理论模型中的CP系统，它具有严格一致的读取和写入。

### 16.PACELEC Theorem

PACELEC定理指出，在复制数据的分布式系统中，

- 如果分布式系统存在网络分区（P）的情况下，必须在可用性（A）和一致性（C）之间进行选择（和CAP定理相同）
- 否则（E），即使系统在没有分区的情况下正常运行，也必须在延迟（L）和一致性（C）之间进行选择

{{< figure src="./pacelc_theorem.png">}}  

定理（PAC）的第一部分与CAP定理相同，ELC是扩展。整个论点假设我们通过复制来保持高可用性。因此，当系统出现故障时，选择CAP定理。但如果没有，我们仍然需要在复制系统的一致性和延迟之间做出选择。

### 17.Hinted Handoff

### 18.Read Repair

### 19.Merkle Trees
