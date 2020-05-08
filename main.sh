#!/bin/bash
#
set -x
# 

{
    echo "<?php"; \
    echo "class DB extends DBmysql {"; \
    echo "   public \$dbhost     = '${DB_HOST}:${DB_PORT}';"; \
    echo "   public \$dbuser     = '${DB_USER}';"; \
    echo "   public \$dbpassword = '${DB_PASSWORD}';"; \
    echo "   public \$dbdefault  = '${DB_DATABASE}';"; \
    echo "}"; \
    echo ; 
 } > /var/www/html/glpi/config/config_db.php

if [ $IS_INSTALLED -eq 1 ];
then
    rm -rf /var/www/html/glpi/install
fi

# Adjusts Permissions
sudo chmod 775 -R /var/www/html/glpi/files /var/www/html/glpi/config
sudo chgrp -R apache /var/www/html/glpi/files /var/www/html/glpi/config

/usr/sbin/httpd -DFOREGROUND