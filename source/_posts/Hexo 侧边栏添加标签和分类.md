---
title: Hexo 侧边栏添加标签和分类
comments: true
tags:
  - Hexo
  - NexT
  - Hexo侧边栏
categories:
  - 创建博客
date: 2025-08-04 16:00:00
---


Hexo 网站的侧边栏默认是没有 <分类> 以及 <标签> 这些页面的，来看看怎么添加这些页面到侧边栏吧！
<!-- more -->

> 参考： 
> [Front-matter | Hexo](https://hexo.io/zh-cn/docs/front-matter)
> [Hexo使用攻略-添加分类及标签 | linlif-blog](https://linlif.github.io/2017/05/27/Hexo%E4%BD%BF%E7%94%A8%E6%94%BB%E7%95%A5-%E6%B7%BB%E5%8A%A0%E5%88%86%E7%B1%BB%E5%8F%8A%E6%A0%87%E7%AD%BE/)
## 侧边栏添加 “tags/标签” 页面
在 `博客文件夹\source` 下新建一个文件夹，命名为 `tags` 。
在tags 文件夹下创建 `index.md` 文件，并向其中添加如下markdown文本。
```
---
title: 标签
date: 2023-06-03 17:28:10
type: "tags"
---
```
## 侧边栏添加 “categories/分类” 页面
在 `博客文件夹\source` 下新建一个文件夹，命名为 `categories` 。
在tags 文件夹下创建 `index.md` 文件，并向其中添加如下markdown文本。
```
---
title: 分类
date: 2023-06-03 17:28:10
type: "categories"
---
```

- 标签的英文单词是：tags
- 分类的英文单词是：categories
> 这两个单词是 Hexo 官方规定的

> 在 Hexo 中分类是有父级子级的，而标签没有父子级。同一篇文章可以有多个分类和多个标签。

