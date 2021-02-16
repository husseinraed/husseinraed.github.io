#!/usr/bin/fish

jekyll build

cd _site

python -m http.server
