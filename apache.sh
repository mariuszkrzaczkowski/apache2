sudo apt-get update
sudo apt-get install apache2 libapache2-mod-fastcgi

sudo ls -all /etc/apache2/sites-available

  # enable php-fpm
sudo cp ~/.phpenv/versions/$(phpenv version-name)/etc/php-fpm.conf.default ~/.phpenv/versions/$(phpenv version-name)/etc/php-fpm.conf
sudo cp ~/.phpenv/versions/$(phpenv version-name)/etc/php-fpm.d/www.conf.default ~/.phpenv/versions/$(phpenv version-name)/etc/php-fpm.d/www.conf
#sudo cp -f www.conf ~/.phpenv/versions/$(phpenv version-name)/etc/php-fpm.d/www.conf
sudo a2enmod rewrite actions fastcgi alias
echo "cgi.fix_pathinfo = 1" >> ~/.phpenv/versions/$(phpenv version-name)/etc/php.ini
  # configure apache virtual hosts
sudo cp -f build/travis-ci-apache /etc/apache2/sites-available/000-default.conf
sudo sed -e "s?%TRAVIS_BUILD_DIR%?$(pwd)?g" --in-place /etc/apache2/sites-available/000-default.conf

sudo cp -r -f /home/travis/build/mariuszkrzaczkowski/apache2/xxx.php /var/www/html
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 777 /var/www/html
sudo chmod -R 777 /home/travis/build/mariuszkrzaczkowski/apache2
ls -all 


sudo service apache2 restart
~/.phpenv/versions/$(phpenv version-name)/sbin/php-fpm

echo " ===========    /etc/apache2/conf-available    ============"
sudo ls -all /etc/apache2/conf-available
echo " ===========    /etc/apache2/sites-available    ============"
sudo ls -all /etc/apache2/sites-available
echo " ===========    /etc/apache2/mods-enabled    ============"
sudo ls -all /etc/apache2/mods-enabled


echo " ===========    /etc/apache2/sites-available/000-default.conf    ============"
sudo cat /etc/apache2/sites-available/000-default.conf

echo " ===========    ls -l /etc/apache2/sites-enabled/    ============"
sudo ls -l /etc/apache2/sites-enabled/

echo " ===========    sudo netstat -antp | grep 9000    ============"
sudo netstat -antp | grep 9000

echo " ===========    /etc/apache2/apache2.conf    ============"
sudo cat /etc/apache2/apache2.conf

echo " ===========    /etc/apache2/conf-available/php5-fpm.conf   ============"
sudo cat /etc/apache2/conf-available/php5-fpm.conf


echo " ===========    ~/.phpenv/versions/$(phpenv version-name)/sbin/php-fpm    ============"
#sudo cat ~/.phpenv/versions/$(phpenv version-name)/sbin/php-fpm


sudo ls -all /var/www/html
