---
title: 为 NexT 添加评论系统 Gitalk
comments: true
tags:
  - Hexo
  - NexT
  - Gitalk
categories:
  - 创建博客
---

作为博客作者，我建议你为你的博客添加评论系统。添加评论系统，你可以与读者互动，收集反馈意见。Gitalk是一个简单易用且与你的博客主题兼容的评论系统，它使用GitHub作为后端存储，保证了数据的安全性。此外，Gitalk还支持Markdown语法等功能，你的博客将更具互动性和价值。
——《由ChatGPT编写摘要》
<!--more-->
>评论系统： [Gitalk - GitHub](https://github.com/gitalk/gitalk)
>
>参考教程： [NexT主题更改字体 | 青椒 (zhchhe.github.io)](https://zhchhe.github.io/2023/06/08/NexT%E4%B8%BB%E9%A2%98%E6%9B%B4%E6%94%B9%E5%AD%97%E4%BD%93/)
>
> 参考工具：ChatGPT

## 安装 Gitalk

在博客文件夹下打开 power shell 命令行，输入 `npm i --save gitalk` 安装 Gitalk 插件，安装完成后去 `Blog\node_modules\` 插件文件夹下找到  `gitalk` 文件夹，将  `gitalk` 文件夹复制到 `Blog\themes\next\source\css` 下，如图所示：

![复制的 gitalk 文件夹位置](https://github.com/zhchhe/image-bed/raw/e688f0ae49febb25e0ef85bc64d1ab5dbb53397a/%E5%8D%9A%E5%AE%A2%E5%9B%BE%E7%89%87/Snipaste_2023-06-09_17-46-34.png)

## 将  `<link>` 放入 HTML 头部

HTML 头部路径为：`Blog\themes\next\layout\_layout.njk`

注意：这个代码不能全部复制，`<head>` 中的要复制到 `<head>` 中，就是说 `<link rel="……" href="………………" />` 要加到 `<head>` 中，`<style>` 之间的也要加到 `<head>` 中。

```html
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/gitalk@1/dist/gitalk.css">
  <script src="https://cdn.jsdelivr.net/npm/gitalk@1/dist/gitalk.min.js"></script>
  <!-- or -->
  <link rel="stylesheet" href="https://unpkg.com/gitalk/dist/gitalk.css">
  <script src="https://unpkg.com/gitalk/dist/gitalk.min.js"></script>
```

将上述代码插入到 HTML 头部文件 `_layout.njk` 中，位置为 `<head>` 与 `</head>` 中间即可，（插入时注意位置不要把其他的代码一分为二了）。

在 HTML头部文件中，下方再插入一段代码：

```html
{% if page.comments and theme.gitalk.enable %}
  <div id="gitalk-container"></div>
{% endif %}
```

位置如图所示：

![代码位置](https://github.com/zhchhe/image-bed/raw/e688f0ae49febb25e0ef85bc64d1ab5dbb53397a/%E5%8D%9A%E5%AE%A2%E5%9B%BE%E7%89%87/Snipaste_2023-06-09_17-52-08.png)

## 在 main.styl 文件中添加 gitalk.css

main.styl 文件路径：`Blog\themes\next\source\css\main.styl`

在最下方添加如下代码：

```styl
// gitalk
// --------------------------------------------------
@import 'gitalk/dist/gitalk.css';
// @import Gitalk from 'gitalk';
```

上述那两句话是 Gitalk 的 [GitHub官网](https://github.com/gitalk/gitalk) 上说的，但是我实操以后发现后面那一句怎样都报错，于是索性就把它注释掉了，发现也没啥事。如果这样会有什么问题的话还请评论告诉我啊！

## 注册 OAuth 应用

打开网址：[新 OAuth 应用 (github.com)](https://github.com/settings/applications/new) 注册 OAuth 应用 ，如图填写信息：

![注册 OAuth 应用 ](https://github.com/zhchhe/image-bed/raw/e688f0ae49febb25e0ef85bc64d1ab5dbb53397a/%E5%8D%9A%E5%AE%A2%E5%9B%BE%E7%89%87/Snipaste_2023-06-09_18-09-29.png)

记下客户端ID和密码，一会要用。

![客户端ID 密码](https://github.com/zhchhe/image-bed/raw/e688f0ae49febb25e0ef85bc64d1ab5dbb53397a/%E5%8D%9A%E5%AE%A2%E5%9B%BE%E7%89%87/Snipaste_2023-06-09_18-12-49.png)

## 在 NexT 的配置文件中配置 Gitalk

打开 NexT 的配置文件，找到 gitalk

```yml
  # Gitalk 评论系统
  # 更多信息: https://gitalk.github.io
  gitalk:
    enable: true
    github_id: xxxxx # GitHub 仓库拥有者
    repo: Gitalk-Blog-Talk # GitHub用来存放评论的仓库名称，最好新建一个仓库专门放评论
    client_id: xxxxxxxxxxxxxx # GitHub Application 客户端 ID
    client_secret: xxxxxxxxxxxxxxxxxxxxxxxx # GitHub Application 客户端密码
    admin_user: xxxxx # GitHub repo 拥有者 and 协作者, 与 github_id 填一样的就行
    distraction_free_mode: false # Facebook式无干扰模式
    # 当官方代理不可用时，可以改成自己的代理地址
    #proxy: https://cors-anywhere.azm.workers.dev/https://github.com/login/oauth/access_token 
    # 上面那个这是官方代理地址
    # Gitalk 的显示语言取决于用户的浏览器或系统环境
    # 如果你想让所有访问你网站的人看到统一的语言，你可以设置一个强制语言值
    # Available values: en | es-ES | fr | ru | zh-CN | zh-TW
    language: zh-CN
```

## 初始化创建

```shell
hexo clean
hexo g
hexo d
```

部署完进入文章最下方显示：

![初始化创建](https://github.com/zhchhe/image-bed/raw/e688f0ae49febb25e0ef85bc64d1ab5dbb53397a/%E5%8D%9A%E5%AE%A2%E5%9B%BE%E7%89%87/Snipaste_2023-06-09_18-17-18.png)

```c
未找到相关的 Issues 进行评论
请联系 @zhchhe 初始化创建
```

这时候点击 `使用Github登录` 用自己的 Github 授权登录评论区就建好了。如图：

![效果如图](https://github.com/zhchhe/image-bed/raw/c439fec31648d42b74c5ce90e87cd54b22436ac4/%E5%8D%9A%E5%AE%A2%E5%9B%BE%E7%89%87/Snipaste_2023-06-11_09-54-32.png)
