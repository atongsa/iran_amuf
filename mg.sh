#!/usr/bin/env

# cd
cd /home/atongsa/Documents/projects/papers/20221110_iran_amuf/ana/v2/sc

# gh
gh repo create --public iran_amuf [flags]
git init
git remote add origin https://github.com/atongsa/iran_amuf
git add .
git commit -am 'sc_iran_amuf'
git push origin master

# kk