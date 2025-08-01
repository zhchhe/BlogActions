---
title: 更改评论系统 Gitalk 样式
comments: true
tags:
  - Gitalk
  - NexT
  - 个人博客
categories:
  - 创建博客
---

我们的博客通常都会有评论系统，我使用的是 Gitalk评论系统。我的主题是暗色调，但 Gitalk默认的主题是亮色调。如何更改这些元素的颜色呢？来看看我的教程吧。
<!--more-->

## 通过浏览器的“检查”查看 Gitalk 的 css样式表

Gitalk 评论系统的 css 文件路径可以在本地加载的网页查看，具体步骤如下：

1. 在本地加载的网页右击选择“检查”，然后在弹出的窗口处，点击这个图标。
2. 点击选择你想更改的元素，之后观察右下角的样式表。

## 观察相关元素的 css 样式

![查看样式表](https://github.com/zhchhe/image-bed/raw/0003d2e6cdb060e5ea50f9e35ea28eeb749fbcf6/%E5%8D%9A%E5%AE%A2%E5%9B%BE%E7%89%87/Snipaste_2023-06-11_17-21-40.png)

1. 样式表中的元素可能有多个重复的值，这些重复的值只保留一个最高优先级的值，其他低优先级的值将被高优先级的值覆盖。低优先级的值会被覆盖，你看到的带有删除线的值就是已经被覆盖的值，可以找到最高优先级的那个值，就是没有删除线的那个值，去更改它。
![查看样式表](https://github.com/zhchhe/image-bed/raw/0003d2e6cdb060e5ea50f9e35ea28eeb749fbcf6/%E5%8D%9A%E5%AE%A2%E5%9B%BE%E7%89%87/Snipaste_2023-06-11_18-00-59.png)
2. 鼠标移动到你想更改的那个值上查看，如果最高优先级的地址显示的是一个其他的网络地址而不是你自己主机上的地址也不是你GitHub的地址，那么就说明你查看的这一个css样式是从这个网站应用过来的，那么这个时候你是无法更改它的且它是最高优先级。
3. 你可以打开它显示的那个网址，它的内容就是css样式表中的内容。而你没办法更改那个网络地址上的样式表它，因为它被很多人使用。但你必须更改它，因为它占用了你这个值的第一优先级。
4. 这个时候你就可以去找第二优先级的值，如果它是你的电脑上的值，那么就可以通过提高你电脑上css文件的优先级来覆盖以前的css文件的优先级。
5. 像图中所示的这个地址，对应的是本地文件夹： ![本地css样式应用地址](https://github.com/zhchhe/image-bed/raw/0003d2e6cdb060e5ea50f9e35ea28eeb749fbcf6/%E5%8D%9A%E5%AE%A2%E5%9B%BE%E7%89%87/Snipaste_2023-06-11_18-16-43.png)
6. 提高优先级的方法就是在相关的属性后面加上 `!important;` 这样的话你的第二优先级的css文件就会被提前为第一优先级，你在生成网站的时候就会优先使用带有  `!important;` 的 css 样式。

> 注意，你去修改低优先级的值是没有意义的，会被覆盖就没有意义。

相关文件地址和步骤：

1. 首先查看相关元素的本地路径。如图为： `http://localhost:4000/css/main.css` ，意思就是这里的css样式是按照 `/css/main.css` 中的样式设置的。

![本地css样式应用地址](https://github.com/zhchhe/image-bed/raw/0003d2e6cdb060e5ea50f9e35ea28eeb749fbcf6/%E5%8D%9A%E5%AE%A2%E5%9B%BE%E7%89%87/Snipaste_2023-06-11_18-16-43.png)

2. 来到（1）中的位置，即打开本地上的 `D:\6-web\Blog\themes\next\source\css\main.styl` ，这里面的 Gitalk 中的 css 样式的地址就是你的那个网页上的元素在 Gitalk 中所使用样式的文件位置。

> 注意：main.styl 可以是其他的后缀名，因为我看其他的教程后缀名都会不一样。

![指向的css文件](https://github.com/zhchhe/image-bed/raw/0003d2e6cdb060e5ea50f9e35ea28eeb749fbcf6/%E5%8D%9A%E5%AE%A2%E5%9B%BE%E7%89%87/Snipaste_2023-06-11_18-20-33.png)

3. 来到（2）中的位置，查看这个文件夹中的 `gitalk.css` 文件，找到你的那个元素。

![css文件所在位置](https://github.com/zhchhe/image-bed/raw/0003d2e6cdb060e5ea50f9e35ea28eeb749fbcf6/%E5%8D%9A%E5%AE%A2%E5%9B%BE%E7%89%87/Snipaste_2023-06-11_18-18-49.png)

4. 在 `gitalk.css` 中找到网页中的那个元素，即（1）中的 那一大堆代码，在其后方添加  `!important` ，这样就将该元素的这个颜色的优先级提高了。

![加上提高优先级的代码](https://github.com/zhchhe/image-bed/raw/0003d2e6cdb060e5ea50f9e35ea28eeb749fbcf6/%E5%8D%9A%E5%AE%A2%E5%9B%BE%E7%89%87/Snipaste_2023-06-11_18-23-28.png)

5. 至此，更改 Gitalk 样式的教程结束，如果你有什么不太懂的地方可以在我的评论区告诉我，我将为你解答。

> 像我这种不会使用css的，经常性在不同的地方复制好几份文件，具体用的是哪一个从来没关注过。经此“大战”，以后就知道博客中的元素用的最高优先级的样式是哪一个文件了。
> 撒花！ 这个 Gitalk 评论可费了我不少心血，好似在某个瞬间突然就明白了，然后马不停蹄的就来总结，这个过程太爽了。
