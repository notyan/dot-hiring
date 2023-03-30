# Informasi environment server sesuai dengan ketentuan
## Installation Process
The installation process of server environment are using ansible.

1. Run `cd ansible` to change directoy into ansible directory
2. Run `ansible-playbook -i inventory.yml setup-env.yml` to start the environment installation
3. login into vm to configure the mysql root password
4. Run `mysql` to login into mysql interface
5. Run `ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'r00tP455';` to change root password  and the plugin for authentication
6. Exit the mysql interface
7. Run ```ansible-playbook -i inventory.yml mysqlUser.yml``` To create the user for laravel application

### NGINX
Nginx menggunakan versi `nginx version: nginx/1.18.0 (Ubuntu)`

### PHP 8.1
```
PHP 8.1.17 (cli) (built: Mar 16 2023 14:38:37) (NTS)
Copyright (c) The PHP Group
Zend Engine v4.1.17, Copyright (c) Zend Technologies
    with Zend OPcache v8.1.17, Copyright (c), by Zend Technologies
```
### MySQL 5.7
```
mysql  Ver 14.14 Distrib 5.7.41, for Linux (x86_64) using  EditLine wrapper
```
### Composer
```
Composer version 2.5.5 2023-03-21 11:50:05
```
###  Docker
```
Docker version 23.0.2, build 569dd73
```