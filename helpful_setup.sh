#!/bin/bash

echo "alias gcm='git commit'" >> ~/.zshrc
echo "alias gpsup='git pushup'" >> ~/.zshrc
echo "alias gp='git push'" >> ~/.zshrc
echo "alias dockup='docker-compose up -d'" >> ~/.zshrc
echo "git config --add alias.pushup '!git push --set-upstream origin $(git symbolic-ref --short HEAD)'" >> ~/.zshrc
touch .env.yml
echo 'export DATABASE_USERNAME="<replace with username"' >> ./.env.yml
echo 'export DATABASE_PASSWORD="replace with password"' >> ./.env.yml
echo "you will need to change the password and username with your username and password in the generated env file"
pwd >> path_to_env
echo `source $path_to_env/.env.yml` >> ~/.zshrc
echo "added gcm alias for git commit"
echo "added gpsup command for when you push a new branch for the first time"
echo "added dockup alias for docker=compose up -d"
echo "added gp for git push"