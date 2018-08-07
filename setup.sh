#!/bin/bash

echo "---- Iniciando instalacao do ambiente de Desenvolvimento PHP/NGINX/NPM ---"

echo "--- Atualizando lista de pacotes ---"
sudo apt-get update

echo "--- Instalando pacotes basicos ---"
sudo apt-get install software-properties-common vim curl python-software-properties git-core zip unzip --assume-yes --force-yes

echo "--- Adicionando repositorio do pacote PHP ---"
sudo add-apt-repository ppa:ondrej/php

echo "--- Atualizando lista de pacotes ---"
sudo apt-get update

echo "--- Baixando e Instalando NodeJs ---"
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs build-essential

echo "--- Baixando e Instalando EasyEngine ---"
sudo bash -c 'echo -e "[user]\n\tname = abc\n\temail = root@localhost.com" > /root/.gitconfig'
wget -qO ee rt.cx/ee && sudo bash ee

echo "--- Instalando PHP, Mysql, Nginx pelo EE ---"
sudo ee stack install

echo "--- Baixando e Instalando Composer ---"
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

echo "--- Instalando PHP 7.1 e alguns modulos ---"
sudo apt-get install php7.1 php7.1-common --assume-yes --force-yes
sudo apt-get install php7.1-cli php7.1-mysql php7.1-curl php-memcached php7.1-dev php7.1-mcrypt php7.1-sqlite3 php7.1-mbstring php7.1-fpm php7.1-xml --assume-yes --force-yes

echo "--- Instalando PHP 7.2 e alguns modulos ---"
sudo apt-get install php7.2 php7.2-common --assume-yes --force-yes
sudo apt-get install php7.2-cli php7.2-mysql php7.2-curl php7.2-dev php7.2-sqlite3 php7.2-mbstring php7.2-fpm php7.2-xml --assume-yes --force-yes

echo "--- Copiando arquivos de configuração PHP e NGINX ---"
sudo cp /tmp/conf_extra/php/7.1/fpm/pool.d/www.conf /etc/php/7.1/fpm/pool.d/www.conf
sudo cp /tmp/conf_extra/php/7.2/fpm/pool.d/www.conf /etc/php/7.2/fpm/pool.d/www.conf
sudo cp /tmp/conf_extra/nginx/conf.d/upstream.conf /etc/nginx/conf.d/upstream.conf
sudo cp /tmp/conf_extra/nginx/common/* /etc/nginx/common

echo "[OK] --- Ambiente de desenvolvimento concluido ---"
