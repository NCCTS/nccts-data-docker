#!/bin/bash

git clone https://github.com/NCCTS/nccts.org.git
cd nccts.org
latest_tag=$(git describe --tags 2>/dev/null)
if [ -n "$latest_tag" ]; then
    git checkout $latest_tag
else
    echo "no tags, sticking with HEAD on master..."
fi
cd ..
mv nccts.org/site ./
rm -rf nccts.org
