#!/bin/bash

cd $HOME/nccts.org
git checkout master
git pull
latest_tag=$(git describe --tags 2>/dev/null)
if [ -n "$latest_tag" ]; then
    git checkout $latest_tag
else
    echo "no tags, sticking with HEAD on master..."
fi
