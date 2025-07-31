---
title: NexT主题更改字体
comments: true
tags:
  - Hexo
  - NexT
  - 更换主题字体
categories:
  - 创建博客
wordCount: 509
charCount: 11739
imgCount: 2
vidCount: 0
wsCount: 0
cbCount: 0
readTime: About 3 minutes
date: 2023-06-08 12:55:33
---

可能 NexT 默认的字体你想更改一下，我这里应用了一款开源中文字体，霞鹜文楷。文件包括web使用教程可在GitHub上找到，一起来看看我是如何应用这款字体到我的网站上的吧。
<!-- more -->

> 所用字体：[一款开源中文字体，霞鹜文楷](https://github.com/lxgw/LxgwWenKai)

> 教程参考：[LXGW-霞鹜文楷-网络字体](https://github.com/chawyehsu/lxgw-wenkai-webfont)

## 使用 npm 安装hexo的霞鹜文楷字体插件

```shell
npm install --save lxgw-wenkai-webfont
# or Lite version
npm install --save lxgw-wenkai-lite-webfont
# or TC version
npm install --save lxgw-wenkai-tc-webfont
# or Screen version
npm install --save lxgw-wenkai-screen-webfont
```

> 以上选择其一就可以，一般为第一个。

> 如果出现npm卡住则需要更换npm源，请看我的另一篇文章 [解决npm经常下载过慢甚至卡住不动的问题](https://zhchhe.github.io/2023/06/08/%E8%A7%A3%E5%86%B3npm%E7%BB%8F%E5%B8%B8%E4%B8%8B%E8%BD%BD%E8%BF%87%E6%85%A2%E7%94%9A%E8%87%B3%E5%8D%A1%E4%BD%8F%E4%B8%8D%E5%8A%A8%E7%9A%84%E9%97%AE%E9%A2%98)

安装成功后 hexo 的插件文件夹 `Blog\node_modules\` 中会多出来 霞鹜文楷的文件夹。

## 在 next 的备用配置中 `theme_config:` 的里面添加如下代码：

```yml
 font:
    enable: false
    host:              # host留空就行

    global:
      external: true
      family: LXGW WenKai
      size:

    title:
      external: true
      family: LXGW WenKai
      size:

    headings:
      external: true
      family: LXGW WenKai
      size:

    posts:
      external: true
      family: LXGW WenKai

    codes:
      external: true
      family: LXGW WenKai
```

> 切记要多缩进一次！我用的是官网的第二种备用配置的方法。或者你可以使用我的方法，我是重新启用了一个与next相同的主题来配置的，但我还没写那个教程。

![next的第二种备用配置的方法](https://github.com/zhchhe/image-bed/raw/1086e15896a795d9a4917fa9548aeeb0fe71554e/%E5%8D%9A%E5%AE%A2%E5%9B%BE%E7%89%87/Snipaste_2023-06-08_01-17-53.png)

> 有关这个备用配置的详细信息请看官网 [NexT --- 配置 | 备用主题](https://theme-next.js.org/docs/getting-started/configuration.html#theme-config)

## 将 `style.css` 导入到您的主 css 样式文件码

css主文件路径为：`Blog\themes\next\source\css\main.styl`

复制如下代码到 `main.styl` 

```css
// lxgw-wenkai-webfont
// --------------------------------------------------
@import 'lxgw-wenkai-webfont/style.css';
body {
  font-family: "LXGW WenKai", sans-serif;
}
/* Mono font (optional) */
pre,code {
  font-family: "LXGW WenKai Mono", sans-serif;
}
```

## 复制安装的 hexo 字体插件到路径 css 路径下

> 提示：如果不做这步，生成网页静态文件时会出现找不到 `'lxgw-wenkai-webfont/style.css'` 这个目录或文件。我不知道什么原因，反正复制过去就没事了。

将 `Blog\node_modules\` 目录下的霞鹜文楷字体文件夹全部复制到 `Blog\themes\next\source\css` 这个目录下，如图所示：

![复制安装的 hexo 字体插件到路径 css 路径下](https://github.com/zhchhe/image-bed/raw/83cf066e0f3ba4e2d6c571ac94eeb6c7afdb2ced/%E5%8D%9A%E5%AE%A2%E5%9B%BE%E7%89%87/Snipaste_2023-06-08_12-39-09.png)

## 将 jsDelivr `<link>` 放入您的 html 头部

html头部路径为：`Blog\themes\next\layout\_layout.njk`

注意：这个代码不能全部复制，`<head>` 中的要复制到 `<head>` 中，就是说 `<link rel="……" href="………………" />` 要加到 `<head>`  中，`<style>` 之间的也要加到  `<head>` 中。

```html
<html>
<head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/lxgw-wenkai-webfont@1.1.0/style.css" />
  <!-- Lite version -->
  <!-- example of mirror cdn.bootcdn.net-->
  <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/lxgw-wenkai-webfont/1.6.0/style.min.css" />
  <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/lxgw-wenkai-screen-webfont/1.6.0/style.min.css" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/lxgw-wenkai-lite-webfont@1.1.0/style.css" />
  <!-- TC version -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/lxgw-wenkai-tc-webfont@1.0.0/style.css" />
  <!-- Screen version -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/lxgw-wenkai-screen-webfont@1.1.0/style.css" />
  <style>
    body {
      font-family: "LXGW WenKai", sans-serif;
      /* Lite version */
      font-family: "LXGW WenKai Lite", sans-serif;
      /* TC version */
      font-family: "LXGW WenKai TC", sans-serif;
      /* Screen version */
      font-family: "LXGW WenKai Screen", sans-serif;
    }
  </style>
</head>
<body>
  <!-- blablabla -->
</body>
</html>
```

## 即可全局使用 LXGW WenKai 字体

> 如果想要部分是  LXGW WenKai 字体请参考官方文档 [NexT --- 配置 |字体定制](https://theme-next.js.org/docs/theme-settings/miscellaneous.html#GitHub-Banner)

## 讲个题外话

我昨晚搞这个搞到半夜一点多，怎么都弄不好，最后困得实在遭不住了，于是将上述的方法一股脑都应用上去，hexo clean、hexo g、hexo d 后发现GitHub文章正文的字体仍没有变化，遂放弃想等今早再试试看行不行。

谁料今早登上去我的GitHub托管的静态网页一看，字体全部应用成功了，令我百思不得其解。不过既然成功了，那就稀里糊涂做个不太标准的教程看吧。可以供有缘人来参考参考，也可以等日后我再回看的时候有帮助。
