#!/bin/sh

# 任一步骤执行失败都会终止整个部署过程
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# 构建静态内容
hugo --minify # if using a theme, replace with `hugo -t <YOURTHEME>`

# 远程目录设为 ssh 服务的 22 端口，防止本地修改了 ssh 默认端口
git remote set-url origin ssh://git@github.com:22/yyj08070631/yyj08070631.github.io.git

# 切换到 Public 文件夹
cd public

# 添加更改到 git
git add --all

# 提交更改
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
msg="$*"
fi
git commit -m "$msg"

# 推送到远程仓库
git push origin master