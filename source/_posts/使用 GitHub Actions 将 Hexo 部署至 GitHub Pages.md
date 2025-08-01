---
title: 使用 GitHub Actions 将 Hexo 部署至 GitHub Pages
comments: true
tags:
  - GitHub Actions
  - Hexo
  - GitHub Pages
  - 自动化
categories:
  - 创建博客
---

也许你已经对hexo本地clean、生成再推送部署的流程，GitHub Actions 可以帮你在推送博客源代码后，自动构建并部署 Hexo 博客到 GitHub Pages，无需手动构建和上传！
<!-- more -->

> 参考：[在 GitHub Pages 上部署 Hexo | Hexo](https://hexo.io/zh-cn/docs/github-pages)

> 总结：先提交初始化的`Hexo`到`GitHub`仓库，再新建一个自动化脚本推送到`GitHub`仓库

本文将使用 [GitHub Actions](https://docs.github.com/zh/actions) 部署至 GitHub Pages，此方法适用于公开或私人储存库。若你不希望将源文件夹上传到 GitHub，请参阅 [一键部署](app://obsidian.md/index.html#%E4%B8%80%E9%94%AE%E9%83%A8%E7%BD%B2)。一键部署只将网页文件上传到GitHub，利用GitHub Actions可以上传网页的整个源文件，包括主题、模板等等。

## 建立 `GitHub` 储存库
	你需要创建一个 GitHub 仓库，并将你的本地仓库推送到该仓库。访问你的 GitHub 仓库，从主菜单中选择“设置”>“页面”。然后在屏幕中央你会看到这个选项：
	![](https://theme-next.js.org/images/github-pages.png)
- 将“源”更改为 GitHub Actions。更改会立即生效；您无需点击“保存”按钮。
- 在您的本地仓库中创建一个空文件 `.github/workflows/hexo.yaml` 。复制下方 YAML 文件并粘贴到您创建的文件中。根据需要更改分支名称和其他参数。**什么都不用改动**

## 生成 `Hexo` 博客文件夹`npm install -g hexo-cli` 
详情看 [[1-GitHub Pages + Hexo搭建个人博客网站|GitHub Pages + Hexo搭建个人博客网站]] 
## 初始化git
```
git init
```
## 添加名为 origin 的远程仓库。
```
git remote add origin <远程仓库的 URL>
```
> <远程仓库的 URL>就是远程 GitHub库的 https地址。
## 将 Hexo 文件夹 push 到储存库的默认分支
默认分支通常名为 `main`
```
git add .
git commit -m "第一次提交Hexo到GitHub"
git push origin main
```
## 在本地博客以下路径中创建自动化脚本文件 `hexo.yml`
 `.github/workflows/hexo.yml`，并填入以下内容
```yml
# 部署 Hexo 网站到 GitHub Pages 的工作流程
name: Deploy Hexo site to Pages

on:
  # 当推送到 main 分支时触发工作流程
  push:
    branches: [main]

  # 允许从 GitHub Actions 界面手动运行工作流程
  workflow_dispatch:

# 设置 GITHUB_TOKEN 的权限，允许将内容写入 GitHub Pages
permissions:
  contents: read        # 只读代码仓库内容
  pages: write          # 写入 Pages 内容
  id-token: write       # 用于身份验证

# 控制并发部署：同一时间只允许一个部署任务运行
# 新的部署任务排队等待，**不取消**当前正在运行的任务
concurrency:
  group: "pages"           # 同一部署组
  cancel-in-progress: false

# 默认使用 bash shell 执行命令
defaults:
  run:
    shell: bash

jobs:
  # 构建任务
  build:
    runs-on: ubuntu-latest       # 在最新版 Ubuntu 环境中运行
    steps:
      - name: Checkout
        uses: actions/checkout@v3   # 拉取源码，包括子模块
        with:
          submodules: recursive

      - name: Setup Pages
        id: pages
        uses: actions/configure-pages@v5   # 配置 GitHub Pages 环境

      - name: Use Node.js 18.x
        uses: actions/setup-node@v3       # 设置 Node.js 环境
        with:
          node-version: "18"

      - name: Install Dependencies
        run: npm install                  # 安装项目依赖

      - name: Build with Hexo
        run: npx hexo g                   # 生成静态文件（默认输出在 ./public）

      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3   # 上传生成的静态站点
        with:
          path: ./public                        # 指定要上传的目录

  # 部署任务
  deploy:
    environment:
      name: github-pages                      # 指定部署的环境名（GitHub Pages）
      url: ${{ steps.deployment.outputs.page_url }}  # 输出部署后的页面链接
    runs-on: ubuntu-latest
    needs: build                               # 等待 build 任务完成
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4          # 正式部署到 GitHub Pages

```
## 再将自动化脚本提交到 `GitHub`
```
git init
git add .
git commit -m "提交自动化脚本到GitHub"
git push origin main
```
## 查询GitHub页面部署成功与否
结束。以后在本地上只需要进行以下这四步直接提交到GitHub就行了
```
git init
git add .
git commit -m "更新文章到GitHub"
git push origin main
```
