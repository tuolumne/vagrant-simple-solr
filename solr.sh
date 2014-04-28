useradd solr 
cd /vagrant
if ! [ -e /vagrant/jdk-7u55-linux-x64.tar.gz ]; 
then	
	wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u55-b13/jdk-7u55-linux-x64.tar.gz 	
fi
tar -xzf /vagrant/jdk-7u55-linux-x64.tar.gz -C /opt
ln -s /opt/jdk1.7.0_55 /opt/jdk_latest

if ! [ -e /vagrant/solr-4.7.2.tgz ];
then 
	wget http://apache.mirrors.pair.com/lucene/solr/4.7.2/solr-4.7.2.tgz
fi
tar -xzf /vagrant/solr-4.7.2.tgz -C /opt
mv /opt/solr-4.7.2 /opt/solrInstall
chmod -R g+w /opt/solrInstall 
chown -R root:solr /opt/solrInstall
su - -c "export PATH=$PATH:/opt/jdk1.7.0_55/bin; cd /opt/solrInstall/example;java -jar start.jar" solr 2>&1 &