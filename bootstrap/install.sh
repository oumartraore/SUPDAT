# Resolution du probleme stdin - Sans trop comprendre pourquoi ? ----
# lien vers la page : http://serverfault.com/questions/500764/dpkg-reconfigure-unable-to-re-open-stdin-no-file-or-directory

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8
dpkg-reconfigure locales

# PREREQUIS DE BASE

#sudo add-apt-repository ppa:openjdk-r/ppa -y
sudo apt-get update
#sudo apt-get install --yes openjdk-7-jre # Fail à l'initialisation du script (Peu être le problème vient du stdin)
sudo apt-get install --yes vim # L'option --yes permet de valider le prompt à l'installation pour automatiser le script
sudo apt-get install --yes ssh
sudo apt-get install --yes rsync
sudo apt-get install --yes build-essential

# INSTALLATION de Hadoop sur la machine Guest, depuis notre configuration

## Mise en place du Framework dans /usr/local
cd /usr/local
cp -Rf /vagrant/liondoop .

cd /usr/bin
ln -s /usr/local/liondoop/bin/ liondoop

cd /usr/sbin
ln -s /usr/local/liondoop/sbin/ liondoop

## Generation de la key ssh -> Pour permettre à localhost de se connecter en ssh
cd ~
ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa
cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys
#ssh localhost
#exit

## Path pour l'environnement JAVA, (L'utilisateur importe peu pour le POC)
#echo "export JAVA_HOME=\$(readlink -f /usr/bin/java | sed \"s:bin/java::\")"
sudo echo "export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/jre/" >> /etc/profile
sudo echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> /etc/profile

## Path pour l'environnement Hadoop (Bien sure /etc/profile devrait suffire, pourquoi ?)
sudo echo "export HADOOP_INSTALL=/usr/local/liondoop" >> /etc/profile
sudo echo "export PATH=\$HADOOP_INSTALL/bin:\$PATH" >> /etc/profile
sudo echo "export PATH=\$HADOOP_INSTALL/sbin:\$PATH" >> /etc/profile

# Normalement pas necessaire (Ci-dessous), si je l'ai mis dans /etc/profile
echo "export HADOOP_INSTALL=/usr/local/liondoop" >> /home/vagrant/.profile
echo "export PATH=\$HADOOP_INSTALL/bin:\$PATH" >> /home/vagrant/.profile
echo "export PATH=\$HADOOP_INSTALL/sbin:\$PATH" >> /home/vagrant/.profile

echo "export HADOOP_INSTALL=/usr/local/liondoop" >> /home/vagrant/.bashrc
echo "export PATH=\$HADOOP_INSTALL/bin:\$PATH" >> /home/vagrant/.bashrc
echo "export PATH=\$HADOOP_INSTALL/sbin:\$PATH" >> /home/vagrant/.bashrc


# Violation des droits pour permettre à un utilisation d'exécuter le POC
sudo chmod -Rf 777 /usr/local/liondoop