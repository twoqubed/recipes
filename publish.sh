#!/bin/bash

rm -Rf .gh-pages
mkdir .gh-pages
cd .gh-pages
git clone git@github.com:twoqubed/recipes.git
git checkout gh-pages
cp ../index.html .
cp ../recipes.css /

echo '{ "recipes" : [' > recipes.json

for file in ../js/*.json ; do 
  cat $file >> recipes.json
  echo "," >> recipes.json
done

echo ']}' >> recipes.json

git status
git add .
git commit -am "Updating site"
git push origin gh-pages
cd ..
