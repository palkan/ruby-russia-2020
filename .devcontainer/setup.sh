#!/bin/sh

# Install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install Dip
sudo curl -L https://github.com/bibendi/dip/releases/download/v6.1.0/dip-`uname -s`-`uname -m` -o /usr/local/bin/dip
sudo chmod +x /usr/local/bin/dip

# Add aliases
mkdir -p ~/.zsh.after
echo "alias be=\"bundle exec\"" >  ~/.zsh.after/aliases.zsh
