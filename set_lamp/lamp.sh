
if [ "$(id -u)" != "0" ]; then  
   echo "This script must be run as root" 1>&2  
   exit 1  
 fi
read -p 'db_root_password [secretpasswd]: ' db_root_password  

echo "************ Install Apache **************"
echo ""
sleep 2s
sudo apt-get install apache2 
echo ""
echo "++++++++++++ Insall PHP ++++++++++++++++++"
echo ""
sleep 2s
 apt-get install php libapache2-mod-php php-mysql -y 

echo "----------- Install MySQL database server ------------"  
 sleep 2s
 echo ""
 export DEBIAN_FRONTEND="noninteractive"  
 debconf-set-selections <<< "mysql-server mysql-server/root_password password $db_root_password"  
 debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $db_root_password"  
 apt-get install mysql-server -y  
 sudo a2enmod rewrite  
sudo apt-get install php-common
 echo ""
sleep 2s  
"^^^^^^^^^^^^ Insyall MyPhpAdmin ^^^^^^^^^^^^" 
 sudo apt-get install phpmyadmin -y  

 sudo chmod 777 /etc/apache2/apache2.conf   
 echo 'Include /etc/phpmyadmin/apache.conf' >> /etc/apache2/apache2.conf  
 
 sudo chown -R www-data:www-data /var/www  

sudo apt-get update
sudo apt-get install phpmyadmin php-mbstring php-gettext
sudo phpenmod mcrypt
sudo phpenmod mbstring

 sudo service apache2 restart  
 