#!/bin/bash

function write_recipes() {
  echo 'var recipes = { "recipes" : [' > site/recipes.js

  num_files=$(ls -1 js | wc -l)
  count=0

  for file in js/*.json ; do 
    count=`expr $count + 1`
    cat $file >> site/recipes.js
    if [ "$count" -ne "$num_files" ]; 
      then echo "," >> site/recipes.js;
    fi
  done

  echo ']}' >> site/recipes.js
}

write_recipes
cp index.html site
cp recipes.css site
