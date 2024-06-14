#!/bin/bash
mkdir -p .local
url="https://api.github.com/repos/nvm-sh/nvm/releases/latest"
LATEST_RELEASE=$(curl -s $url | grep "tag_name" | sed 's/"//g' | sed 's/,//g' | awk '{ print $2 }')
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$LATEST_RELEASE/install.sh | bash
. ~/.nvm/nvm.sh
nvm install --lts
	
