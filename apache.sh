sudo apt-get update
sudo apt-get install apache2 libapache2-mod-fastcgi
  # enable php-fpm
sudo cp ~/.phpenv/versions/$(phpenv version-name)/etc/php-fpm.conf.default ~/.phpenv/versions/$(phpenv version-name)/etc/php-fpm.conf
sudo cp ~/.phpenv/versions/$(phpenv version-name)/etc/php-fpm.d/www.conf.default ~/.phpenv/versions/$(phpenv version-name)/etc/php-fpm.d/www.conf
sudo a2enmod rewrite actions fastcgi alias
echo "cgi.fix_pathinfo = 1" >> ~/.phpenv/versions/$(phpenv version-name)/etc/php.ini
  # configure apache virtual hosts
sudo cp -f build/travis-ci-apache /etc/apache2/sites-available/000-default
sudo sed -e "s?%TRAVIS_BUILD_DIR%?$(pwd)?g" --in-place /etc/apache2/sites-available/000-default

sudo cp -r -f /home/travis/build/mariuszkrzaczkowski/apache2/* /var/www/html
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 777 /var/www/html
ls -all /var/www/html


sudo service apache2 restart
~/.phpenv/versions/$(phpenv version-name)/sbin/php-fpm

