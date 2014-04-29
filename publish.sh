#!/bin/bash

rm -Rf site
mkdir -p site
git clone --branch gh-pages git@github.com:twoqubed/recipes.git site/recipes
rm -Rf site/recipt/*

npm install
grunt merge-json
cp -r static/* site/recipes/.

# cd site && git commit -am "Updating site" && git push origin gh-pages && cd ..
