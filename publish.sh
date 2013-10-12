#!/bin/bash

rm -Rf mkdir .gh-pages
mkdir .gh-pages
cp  -r index.html js .gh-pages
cd .gh-pages
git init
git remote add origin git@github.com:twoqubed/recipes.git
git checkout -b gh-pages
git add .
git commit -am "Updating site"
git push -f origin gh-pages
cd ..
