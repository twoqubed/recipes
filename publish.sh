#!/bin/bash

rm -Rf site
git clone --branch gh-pages git@github.com:twoqubed/recipes.git site

exec ./site.sh

cd site && git commit -am "Updating site" && git push origin gh-pages && cd ..
