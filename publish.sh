#!/bin/bash

rm -Rf mkdir .gh-pages
mkdir .gh-pages
cp  index.html .gh-pages
cp  recipes.css .gh-pages

echo '{ "recipes" : [' > .gh-pages/recipes.json

for file in js/*.json ; do 
  cat $file >> .gh-pages/recipes.json
  echo "," >> .gh-pages/recipes.json
done

echo ']}' >> .gh-pages/recipes.json

cd .gh-pages
git init
git remote add origin git@github.com:twoqubed/recipes.git
git checkout -b gh-pages
git add .
git commit -am "Updating site"
git push -f origin gh-pages
cd ..
