#!/bin/bash

cd $HOME/nccts.org
git checkout master
git pull

if [ "$1" = "tagged" ]; then
    latest_tag=$(git describe --abbrev=0 2>/dev/null)
    if [ -n "$latest_tag" ]; then
        git checkout $latest_tag
    else
        echo "no tags, sticking with HEAD on master..."
    fi
else
    echo "tagged not specified, sticking with HEAD on master..."
fi
