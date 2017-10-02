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

~/.phpenv/versions/$(phpenv version-name)/sbin/php-fpm

sudo cat ~/.phpenv/versions/$(phpenv version-name)/sbin/php-fpm
sudo ls -l /etc/apache2/sites-enabled/
sudo cat /etc/apache2/sites-available/000-default
sudo netstat -antp | grep 9000
sudo /etc/apache2/apache2.conf


sudo service apache2 restart