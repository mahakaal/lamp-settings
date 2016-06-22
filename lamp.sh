#!/usr/bin/env bash

#@author Sukhdev Mohan <sukhdev.mohan@gmail.com>
#@version 1.0
#@copyleft LGPL 3.0

echo "########################################################################"
echo "#  L A M P  .  S E T T I N G S  . A U T O M A T O R  .  S C R I P T  . #"
echo "########################################################################"

echo -n "This script will install some new features (APACHE WEB SERVER, MySQL SERVER and PHP).\nThe author is not responsible for any harms.\nAre you sure you want to continue? (y/Y to continue, n/N to stop) :>"

read ans

if [ "$ans" = "n" ] || [ "$ans" = "N" ]; then
	exit 1
fi

echo "Checking for permission"

if [ $(whoami) != "root" ]; then
	echo "You don't have root permissions. \nRe-execute the script with sudo. \nExiting.";
	exit 1
else
	echo "Permissions are ok!\n\n\tInitializing installation: \n";
fi

echo "Updating APT...";

apt-get update
exit 1
echo "\nInstalling Apache"

apt-get install apache2

echo "\nInstalling MySQL"

apt-get install mysql-server

echo "\nRunning MySQL Post Installation settings"

mysql_secure_installation

echo "\nInstalling PHP"

apt-get install php php libapache2-mod-php php-mcrypt php-mysql

echo "\n\n\tRestarting APACHE web server"

systemctl restart apache2

echo "\nInstalling common PHP features (php-all-dev php-cgi php-cli php-common php-curl php-dev php-gd)"
#Edit the following line by looking for the components by running " sudo apt-cache search php- | less " and adding/removing the components.

apt-get install php-all-dev php-cgi php-cli php-common php-curl php-dev php-gd

echo "\n/var/www Permission settings..."
echo "\n\tAdding your $USER to www-data group"

adduser $USER www-data

echo "\n\tChaninging owner of /var/wwww to www-data"

chown $USER:www-data -R /var/www

echo "\n\tGiving Execute permission"

chmod u=rwX,g=srX,o=rX -R /var/www

echo "<?php \n phpinfo();" > /var/www/html/test.php
echo "\nCreated phpinfo() test file in /var/www/html/test.php";

echo "Please open your broser at localhost/test.php, you should view a phpinfo page else soemthing went wrong install manually."

echo "\n\n\t\t\t End Installation\nTank you for using this utility."
