#!/usr/bin/env bash
# Author: JesusMtnez

cd /tmp # Execute script in /tmp

NAME="Hack_latest"
URL=$(curl -silent https://api.github.com/repos/chrissimpkins/Hack/releases/latest | grep -o 'https://.*ttf.zip')

# Download ZIP
curl --output $NAME.zip --silent --location --remote-name $URL

# Unzip
unzip -qo $NAME -d $NAME

# Install font
if [ `uname` = 'Darwin' ]; then
  cp -R $NAME/ $HOME/Library/Fonts/ # OSX user fonts
else
  cp -R $NAME/ $HOME/.fonts/ # Linux user fonts
fi

echo "Latest Hack font release installed!"
