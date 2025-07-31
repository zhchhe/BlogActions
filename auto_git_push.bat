@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: 提示用户输入提交信息
set /p commit_msg=请输入提交信息（用于 git commit -m）：

:: 初始化 Git 仓库
git init

:: 添加所有文件
git add .

:: 提交文件
git commit -m "%commit_msg%"

:: 推送到 main 分支
git push origin main

pause
