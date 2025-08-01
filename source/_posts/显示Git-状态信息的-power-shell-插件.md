---
title: 显示 Git 状态信息的 power shell 插件
comments: true
tags:
  - Git
  - 插件
categories:
  - 插件
---
我们在使用 Git 的时候经常会需要使用 git status 来查看 Git 的状态，有了这款 power shell 插件，就可以实时显示 Git 的状态了。
<!--more-->

> 目标：安装power shell脚本以便更清晰的观察Git的状态

## 安装 posh-git ：Git 的 PowerShell 环境

GitHub页面：[posh-git：Git 的 PowerShell 环境](https://github.com/dahlbyk/posh-git)

Git地址：`https://github.com/dahlbyk/posh-git.git`

安装过程：

1. 下载解压后为如下文件夹：

![posh-git 解压后的文件夹](https://github.com/zhchhe/image-bed/raw/f15174764897ccd98ed624a141eb5e4fe04099a0/%E5%8D%9A%E5%AE%A2%E5%9B%BE%E7%89%87/Pasted%20image%2020230605095923.png)
2. 在此文件夹中 Shitf+鼠标右键点击空白区域选择在此处打开 power shell窗口 ，或者管理员打开 power shell ，cd到这个文件夹下。
3. 使用 `.\install.ps1` 命令安装它。
4. 安装成功以后在git库中打开power shell就会看到如下状态：

![Git状态信息](https://github.com/zhchhe/image-bed/raw/f15174764897ccd98ed624a141eb5e4fe04099a0/%E5%8D%9A%E5%AE%A2%E5%9B%BE%E7%89%87/Pasted%20image%2020230605100535.png)

## PowerShell 环境下 Git 的状态信息

默认情况下，状态摘要具有以下格式：

     [{头名} S +A ~B -C !D | +E ~F -G !H W]

- （前状态）
- `{HEAD-name}` 是当前分支，或者分离的 HEAD 的 SHA
  - 青色表示分支与其远程匹配
  - 绿色表示分支领先于其远程（绿灯推动）
  - 红色表示分支在其远程后面
  - 黄色表示分支在其远程之前和之后
- `S` 表示与远程（跟踪源）分支相关的分支状态。

   注意：此状态信息反映了在远程的最后一个 `git fetch/pull` 之后远程跟踪分支的状态。 执行 `git fetch` 以更新到默认远程仓库的最新版本。 如果你有多个遥控器，执行 `git fetch --all`。

  - `≡` = 与远程分支处于同一提交级别的本地分支 (`BranchIdenticalStatus`)
  - `↑<num>` = 本地分支领先于远程分支指定的提交数； `git push` 是
     需要更新远程分支（`BranchAheadStatus`）
  - `↓<num>` = 本地分支落后于远程分支指定的提交次数； `git pull` 是
     需要更新本地分支（`BranchBehindStatus`）
  - `<a>↕<b>` = 本地分支比远程分支领先指定的提交次数 (a) 和落后
     按指定的提交次数 (b)； 在将本地更改推送到之前，需要对本地分支进行 rebase
     远程分支（`BranchBehindAndAheadStatus`）。 注意：此状态仅在以下情况下可用
     `$GitPromptSettings.BranchBehindAndAheadDisplay` 设置为 `Compact`。
  - `×` = 本地分支正在跟踪远程分支（`BranchGoneStatus`）

- `ABCD` 代表索引； `|` (`DelimStatus`); `EFGH` 代表工作目录
  - `+` = 添加的文件
  - `~` = 修改后的文件
  - `-` = 已删除的文件
  - `!` = 冲突的文件
  - 与 `git status` 输出一样，索引状态显示为深绿色，工作目录状态显示为深红色

- `W` 代表工作目录的整体状态
  - `!` = 工作树中有未暂存的更改（`LocalWorkingStatusSymbol`）
  - `~` = 有未提交的更改，即工作树中的暂存更改等待提交（`LocalStagedStatusSymbol`）
  - None = 工作树没有未暂存或未提交的更改 (`LocalDefaultStatusSymbol`)（`AfterStatus`）

符号和周围的文本可以通过 `$GitPromptSettings` 上的相应属性进行自定义。

例如，状态为`[main ≡ +0 ~2 -1 | +1 ~1 -0]` 对应以下 `git status`：

```shell
On branch main

Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

       modified:   this-changed.txt
       modified:   this-too.txt
       deleted:    gone.ps1

Changed but not updated:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

       modified:   not-staged.ps1

Untracked files:
  (use "git add <file>..." to include in what will be committed)

       new.file
```
