#!/bin/bash

rm -Rf mkdir .gh-pages
git clone origin git@github.com:twoqubed/recipes.git .gh-pages
cp index.html .gh-pages
cp recipes.css .gh-pages

echo '{ "recipes" : [' > .gh-pages/recipes.json

for file in js/*.json ; do 
  cat $file >> .gh-pages/recipes.json
  echo "," >> .gh-pages/recipes.json
done

echo ']}' >> .gh-pages/recipes.json

cd .gh-pages
git status
git add .
git commit -am "Updating site"
git push origin gh-pages
cd ..
