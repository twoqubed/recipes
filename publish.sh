#!/bin/bash

rm -Rf site
git clone git@github.com:twoqubed/recipes.git site
cd site && git fetch && git checkout gh-pages && cd ..

exec ./site.sh

cd site && git commit -am "Updating site" && git push origin gh-pages && cd ..
