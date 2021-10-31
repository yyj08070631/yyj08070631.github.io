#!/bin/sh

# 任一步骤执行失败都会终止整个部署过程
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# 构建静态内容
hugo --minify --destination "./docs" # if using a theme, replace with `hugo -t <YOURTHEME>`

# 切换到 docs 文件夹
cd docs

# 添加更改到 git
git add --all

# 提交更改
git commit -m "Publishing to master (deploy.sh)"

# 推送到远程仓库
git push --force origin master