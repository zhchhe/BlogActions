---
title: GitHub Pages + Hexo搭建个人博客网站
comments: true
tags:
  - GitHub Pages
  - Hexo
  - 个人博客
categories:
  - 创建博客
---
GitHub是一个非常好用的用来存放代码或图片的仓库，搭配Hexo使用可以在 GitHub Pages 上搭建个人博客。

<!-- more -->
## 准备工作

1. GitHub 账号
2. 安装 Git
3. 安装最新版 Node.js

## 创建 GitHub 仓库

1. 在 GitHub 上创建一个仓库以上传我们本地的网页。
2. 仓库名为 `<你的 GitHub 用户名>.github.io` ，然后创建此仓库此步一定不能出错，仓库名必须是用户名后面加 `github.io` 。

## 本地安装Hexo并初始化

我们采用Hexo来创建我们的博客网站，Hexo 是一个基于NodeJS的静态博客网站生成器，使用Hexo不需开发，只要进行一些必要的配置即可生成一个个性化的博客网站，非常方便。

1. 在本地创建一个文件夹用来建博客网站，在文件夹内 shift+鼠标右键 在此处打开 `Git Bash Here` 。
2. 在文件夹中打开的Git Bash窗口中，用 `npm install -g hexo-cli` 指令安装 hexo 博客。
3. 安装完成后输入 `npx hexo init` 初始化 hexo 博客。

> 初始化过程会比较慢，慢慢等就好了。

4. 再接着执行命令 `npx hexo g` 进行生成网页。
5. 这时网页已经部署完成，接着输入命令 `hexo s` 本地启动即可：

此时浏览器输入 [http://localhost:4000](http://localhost:4000) 就可以打开新部署的网页了。

> Hexo官网也有详尽的教程。[文档 | Hexo](https://hexo.io/zh-cn/docs/)

> 如果你想把整个代码文件夹都交给GitHub托管，而不是只是让GitHub托管网页，那么可以看我官网的另一个教程（本来想自己写教程，第一次部署成功了，第二次怎么也搞不明白了，于是就索性不写了……不是我偷懒……）

> 或者等这个网站部署完以后，再在 GitHub 上新建一个库专门用来存放网站源代码。

## 将 Hexo 一键部署到 GitHub

1. 回到你希望存放博客源代码的博客文件夹中，打开 `Git Bash`，在 博客文件夹中安装hexo的 `Git` 部署插件，输入命令安装：

```shell
npm install hexo-deployer-git --save
```

2. 我们去博客文件夹📂下,用编辑器打开文件 `_config.yml` ,找到 `deploy` 配置项填入以下内容（一般在最下面）:

> 这一步的意思是我们使用 `hexo-deployer-git` 一键部署要指定的目标仓库和目标分支，指定错的话你在本地生成的网页文件夹就上传不到GitHub库中了。

```markdown
deploy:
 type: git
 repository: https://github.com/你的GitHub用户名/你的GitHub用户名.github.io.git  #你的仓库地址
 branch: main #绑定的仓库分支
```

> 提示：可以去 GitHub 仓库中查看默认分支是什么再设置 deploy。

> 注意：这里注意一下语法，每个 `冒号：` 后面都有一个空格

仓库地址如图：

![仓库地址](https://github.com/zhchhe/image-bed/raw/3e0ac1c410ed2719a53537b2296d13ea5c069e5a/%E5%8D%9A%E5%AE%A2%E5%9B%BE%E7%89%87/Snipaste_2023-06-06_21-58-26.png)

3. 然后在博客文件夹下打开 `git bash`命令行 分别输入以下三条命令：
 
```shell
hexo clean   #清除缓存文件 db.json 和已生成的静态网页文件夹 public
hexo g       #重新生成新修改的网站静态文件到默认设置的 public 文件夹(g是 generate 的缩写)
hexo d       #自动部署网站静态文件夹（public）到设定的仓库(d是 deploy 的缩写)
```

4. 现在为止就能打开 `https://xxx.github.io` 这个网址了。

记住最后这三条命令，后面经常用到，另外还有一个本地网页运行命令 `hexo s` 可以在本地  [http://localhost:4000](http://localhost:4000) 临时预览网页的样子（因为网页部署到GitHub也是要花时间的……）

5. 重要的一点来了，有的同学会抱怨为什么已经部署了但是 `https://xxx.github.io` 还是显示错误啊，这时候你打开自己的GitHub库，看看库的状态是不是正在部署。

![正在部署](https://github.com/zhchhe/image-bed/raw/3e0ac1c410ed2719a53537b2296d13ea5c069e5a/%E5%8D%9A%E5%AE%A2%E5%9B%BE%E7%89%87/Snipaste_2023-06-06_21-58-48.png)

这里显示黄色点且点开以后在转圈表示网页正在部署，大约一分钟左右再重新刷新此页面，待这里变成绿色的 √ ，就算是部署完成了。

![部署完成](https://github.com/zhchhe/image-bed/raw/3e0ac1c410ed2719a53537b2296d13ea5c069e5a/%E5%8D%9A%E5%AE%A2%E5%9B%BE%E7%89%87/Snipaste_2023-06-06_21-59-00.png)

这时候再打开  `https://xxx.github.io` 这个网页就会显示正常了。
