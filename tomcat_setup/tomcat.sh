echo "------------- Tomcat Instalation -----------------"
echo "== Install Java =="
echo ""
sudo apt update 
echo ""
sleep 2s
echo "=== Installing jdk ==="
sleep 2s
echo ""
sudo apt install default-jdk
sleep 2s
echo ""
echo "Creating Tomcat user"
echo ""
sudo groupadd tomcat
sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
echo ""
echo "Instaling Tomcat "
cd /tmp
curl -o https://apachemirror.wuchna.com/tomcat/tomcat-9/v9.0.46/bin/apache-tomcat-9.0.46.tar.gz
sudo mkdir /opt/tomcat
sudo tar xvzf apache-tomcat-*tar.gz -C /opt/tomcat --strip-components=1
echo "Update the permission"
cd /opt/tomcat
sudo chgrp -R tomcat /opt/tomcat
sudo chmod -R g+r conf
sudo chmod g+x conf
sudo chown -R tomcat webapps/ work/ temp/ logs/
sudo update-java-alternatives -l

sudo chmod 777 bin
export CATALENA_HOME=/opt/tomcat/
sleep 2s
echo $CATALENA_HOME
sleep 2s
cd $CATALENA_HOME/bin
sleep 2s
echo "Strating the tomcat"
sudo chmod 777 startup.sh
sudo chmod 777 catalina.sh
sudo ./startup.sh
