#!/bin/bash
set -ev

git clone https://${github.com/lzzitdreamworks/it1024.github.io.git} .deploy_git
cd .deploy_git
git checkout master

cd ../
mv .deploy_git/.git/ ./public/
     
cd ./public                                                                                          
#    - git init

git config user.name "lzzitdreamworks" # 修改name
git config user.email "itdreamworks@163.com" # 修改email

git add .
git commit -m "Travis CI Auto Builder"
git push --force --quiet "https://${Travis_Token}@${github.com/lzzitdreamworks/it1024.github.io.git}"     master:master # GH_TOKEN是在Travis中配置token的名称
