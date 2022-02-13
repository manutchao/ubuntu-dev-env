#!/bin/bash

# Updates
sudo apt update && apt upgrade -y


sudo apt install \
    git \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    vim \
    openjdk-8-jdk \
    build-essential \
    libssl-dev \
    libffi-dev \
    php-cli \
    unzip \
    lsb-release


# Aliases


# Env variables


# Ssh


# GIT
GIT_NAME=""
GIT_EMAIL=""

[  -z "$GIT_NAME" ] && echo echo "user.name ?" && read GIT_NAME
[  -z "$GIT_EMAIL" ] && echo echo "user.email ?" && read GIT_EMAIL

git config --global user.name "$GIT_NAME"
git config --global user.email $GIT_EMAIL
git config --list


# DOCKER
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo docker run hello-world

# DOCKER-COMPOSE
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version


# MongoDB
curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
sudo apt update
sudo apt install mongodb-org
sudo systemctl start mongod.service
sudo systemctl status mongod
sudo systemctl enable mongod

# Cassandra
wget -q -O - https://www.apache.org/dist/cassandra/KEYS | sudo apt-key add -
sudo sh -c 'echo "deb http://www.apache.org/dist/cassandra/debian 311x main" > /etc/apt/sources.list.d/cassandra.list'
sudo apt update
sudo apt install cassandra
sleep 5
nodetool status

# Apache
sudo apt update
sudo apt install apache2

# Composer
cd ~
curl -sS https://getcomposer.org/installer -o composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
echo $HASH
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
composer

# Pyenv
curl https://pyenv.run | bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
source ~/.bashrc
pyenv --version


# Python
sudo apt install -y python3-pip
sudo apt install -y python3-dev
sudo apt install -y python3-venv




# Languages


# Dev tools


# Various tools


# Atom Config

apm install python-jedi
