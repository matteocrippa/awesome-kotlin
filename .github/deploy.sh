#!/bin/bash

set -e

if [[ $TRAVIS_BRANCH != 'master' ]]
then
  exit
fi

git checkout master

git config user.name "Awesome Kotlin"
git config user.email "awesomekotlin@users.noreply.github.com"

echo add readme
git add README.md database.json

echo commit
git commit -m "[auto] [ci skip] Generate README & Database.json"

echo push
git push --quiet "https://${GH_TOKEN_DK}@github.com/matteocrippa/awesome-kotlin" master:master > /dev/null 2>&1
