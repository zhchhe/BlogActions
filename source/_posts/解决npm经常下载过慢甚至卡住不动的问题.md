---
title: 解决npm经常下载过慢甚至卡住不动的问题
comments: true
tags:
  - NexT
  - 更换主题字体
  - 疑难杂症
categories:
  - 疑难杂症
wordCount: 30
charCount: 286
imgCount: 0
vidCount: 0
wsCount: 0
cbCount: 0
readTime: About 13 seconds
date: 2023-06-08 13:27:02
---

有些时候需要用 npm 来安装一些工具，但是进度条可能会很慢甚至卡住，这时候就需要更换 npm 的下载地址了。

<!-- more -->
> 参考：[解决npm经常下载过慢甚至卡住不动的问题_小㿟猿的博客-CSDN博客](https://blog.csdn.net/l13501058595/article/details/105762028)

解决npm经常下载过慢甚至卡住不动的问题

在我们安装完Node.js之后，需要使用npm命令来安装一些工具。

可气的是使用npm命令会下载很慢或者直接卡住不动，相信大家也经常为此事烦恼。

而造成这种情况的原因是：npm的下载地址是国外的。

解决方案是将npm的下载地址转回淘宝的地址。

  1. 首先我们在cmd中输入 `npm config get registry` 命令查看npm的默认下载地址
  2. 之后我们看到的下载地址是 `https://registry.npmjs.org/`
  3. 再使用 `npm config set registry https://registry.npm.taobao.org` 命令将默认下载地址改成淘宝镜像就可以了。
  4. 我们再使用 `npm config get registry` 命令，此时我们看到下载地址变成了`https://registry.npm.taobao.org`

这样我们就可以解决问题了。
