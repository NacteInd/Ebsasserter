#! /bin/bash
sudo yum install jdk-11.x86_64 -y
sudo yum install unzip -y
ip_address = $(hostname -I)
sudo su -
#Update the hostname
hostnamectl set-hostname ebsasserter.com
sudo sed -i 's/rest-wls-0/ebsasserter.com/g' /etc/hosts
#echo "ebsasserter.example.com" >> /etc/hostname
hostname 
#Download ebsasserter zip file then find war,jar and extracting
wget https://github.com/NacteInd/Ebsasserter/blob/main/ebsassert-23.2.92-2301160723.zip
sudo mkdir /temp
cp ebsassert-23.2.92-2301160723.zip /temp/
cd /temp/
unzip ebsassert-23.2.92-2301160723.zip
cd /temp/
wr = $(find -name "*.war")
jr = $(find -name "*.jar")
if [ -d "/opt/ebssdk" ]; then
    cp $wr /opt/ebssdk/
    cp $jr /opt/ebssdk/
else
   sudo mkdir /opt/ebssdk/
   sudo cp $wr /opt/ebssdk/
   sudo cp $jr /opt/ebssdk/
fi
sudo cd /opt/ebssdk/
sudo unzip ebs.war -d /opt/ebssdk/
#sudo jar xf ebs.war
#Edit eblogic.xml file
sudo sed -i s/ebs/samratha/g ebs/WEB-INF/weblogic.xml
sudo mv ebs.war ebscopy.war
#Update Bridge.properties
sudo sed -i 's+https://ebsasserter.example.com:7002/ebs+$app_url+g' bridge.properties
sudo sed -i 's/APPL_SERVER_ID_value/$app_serverid/g' bridge.properties
sudo sed -i 's+https://ebs.example.com:8001/+$ebs_url/+g' bridge.properties
sudo sed -i 's/visionDS/dsname/g' bridge.properties
sudo sed -i 's/idcs-example/$IDCS_GUIID/g' bridge.properties
sudo sed -i 's/#post.logout/post.logout/g' bridge.properties
sudo sed -i 's/\[PATH_OF_THE_WALLET]/\$wallet_path/g' bridge.properties
sudo sed -i 's/#idcs.user.identifier/idcs.user.identifier/g' bridge.properties
sudo sed -i 's+email/username>+username+g' bridge.properties
sudo cp bridge.properties /opt/ebssdk/bridge.properties

#Edit wallet jar file
cd
echo $clientid $secret $url | java -jar /opt/ebssdk/idcs-wallet-*.jar
#wlst to set host name verification
#echo -e "connect('weblogic','A9206486290a@','t3://132.145.160.19:9071')\nedit()\nstartEdit()\ncd('Servers/ebsasserter_server_1/SSL/ebsasserter_server_1')\nset('HostnameVerificationIgnored',1)\nsave()\nactivate()\nexit()" >>python.py
#sudo sed -i 's/weblogic/$weblogic_username/g' hostname.py
cd /home 
chmod -R 777 opc/
cd /home/opc/scripts/
sudo sed -i 's/A9206486290a@/$weblogic_password/g' hostname.py
sudo sed -i 's/URL/$weblogic_url/g' hostname.py
sudo sed -i 's/ebsasserter_server_1/demoebsasserter_server_1/g' hostname.py
/u01/app/oracle/middleware/oracle_common/common/bin/wlst.sh hostname.py
#Create Data Source
#sudo sed -i 's/weblogic/$admin_username/g' myDomain-ds.properties
sudo sed -i 's/Password1/$admin_password/g' myDomain-ds.properties
sudo sed -i 's+t3://ol6.localdomain:7001+$weblogic_url+g' myDomain-ds.properties
sudo sed -i 's/Password1/$admin_password/g' myDomain-ds.properties
sudo sed -i 's/MYDS/dsname/g' myDomain-ds.properties
sudo sed -i 's+jdbc:oracle:thin:@ol7-121:1521/pdb1+$ds_url+g' myDomain-ds.properties
sudo sed -i 's/oracle.jdbc.xa.client.OracleXADataSource/$ds_drive/g' myDomain-ds.properties
sudo sed -i 's/scott/$ds_username/g' myDomain-ds.properties
sudo sed -i 's/tiger/$ds_password/g' myDomain-ds.properties
sudo sed -i 's/Cluster/$ds_targettype/g' myDomain-ds.properties
sudo sed -i 's/Cluster_1/$ds_targetname/g' myDomain-ds.properties
# Set environment.
cmod 755 create_data_source.py myDomain-ds.properties
sudo su oracle
export MW_HOME=/u01/app/oracle/middleware
export WLS_HOME=$MW_HOME/wlserver #needs to check
export WL_HOME=$WLS_HOME
export JAVA_HOME=/u01/app/oracle/jdk
export PATH=$JAVA_HOME/bin:$PATH #needs to check 
export DOMAIN_HOME=/u01/data/domains/ebsasserter_domain #needs to check

. $DOMAIN_HOME/bin/setDomainEnv.sh

# Create the data source.
java weblogic.WLST /home/opc/scripts/create_data_source.py -p /home/opc/scripts/myDomain-ds.properties
#Rebuild war file
cd /opt/ebssdk/
sudo jar -cfv ebs.war ebs
#Deploy the war file
java -cp .:/u01/app/oracle/middleware/wlserver/server/lib/weblogic.jar weblogic.WLST manageApplication.py -u weblogic -p $admin_password -a $weblogic_url -n mytestapplication -f "/opt/ebssdk/ebs/EBS.war" -t demoebsasserter_server_1









