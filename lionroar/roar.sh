# Resolution du probleme stdin - Sans trop comprendre pourquoi ? ----
# lien vers la page : http://serverfault.com/questions/500764/dpkg-reconfigure-unable-to-re-open-stdin-no-file-or-directory

# J'ai pas compris ce block - mais ça permet d'installer les packets
sudo echo "export LANGUAGE=en_US.UTF-8" >> /etc/profile
sudo echo "export LANG=en_US.UTF-8" >> /etc/profile
sudo echo "export LC_ALL=en_US.UTF-8" >> /etc/profile
sudo echo "locale-gen en_US.UTF-8" >> /etc/profile
sudo echo "dpkg-reconfigure locales" >> /etc/profile
# Fin du blick potentiellement dangereu

# PREREQUIS DE BASE

#sudo add-apt-repository ppa:openjdk-r/ppa -y
sudo apt-get update
sudo apt-get install --yes openjdk-7-jre # Fail à l'initialisation du script (Peu être le problème vient du stdin)
sudo apt-get install --yes vim # L'option --yes permet de valider le prompt à l'installation pour automatiser le script
sudo apt-get install --yes python-software-properties
sudo apt-get install --yes ssh
sudo apt-get install --yes rsync
sudo apt-get install --yes build-essential

# INSTALLATION de Hadoop sur la machine Guest, depuis notre configuration

## Mise en place du Framework dans /usr/local
cd /usr/local
cp -Rf /vagrant/liondoop .
cp -Rf /vagrant/lionpig .

cd /usr/bin
ln -s /usr/local/liondoop/bin/ liondoop
ln -s /usr/local/lionpig/bin/ lionpig

cd /usr/sbin
ln -s /usr/local/liondoop/sbin/ liondoop

# Edition de lien pour monter les fichiers de configuration de hadoop dans /etc
#cd /etc
#cp -Rf /vagrant/liondoop/conf liondoop
#ln -s /usr/local/liondoop/sbin/ liondoop -- A reserver à plus tard


## Generation de la key ssh -> Pour permettre à localhost de se connecter en ssh
cd ~
ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa
cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys
#ssh localhost
#echo "TEST DE CONNEXION AVEC SSH REUSSION - TRAORE OUMAR"
#exit

## Path pour l'environnement JAVA, (L'utilisateur importe peu pour le POC)
#echo "export JAVA_HOME=\$(readlink -f /usr/bin/java | sed \"s:bin/java::\")"
sudo echo "export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/jre/" >> /etc/profile
sudo echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> /etc/profile

sudo echo "export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/jre/" >> /home/vagrant/.profile
sudo echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> /home/vagrant/.profile

sudo echo "export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/jre/" >> /home/vagrant/.bashrc
sudo echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> /home/vagrant/.bashrc

#NB : Le choix de JAVA_HOME --> Standard JAVA & compatible avec PIG

## Path pour l'environnement Hadoop (Bien sure /etc/profile devrait suffire, pourquoi ? -> c'est pas moi qui est crée cette boxe, je la paramère juste) - donc l'utilisateur je peux le créer avec un script, mais celui par défaut, j'ai la flemme de regarder, comment il utilise bash
sudo echo "export HADOOP_HOME=/usr/local/liondoop" >> /etc/profile
sudo echo "export PATH=\$HADOOP_HOME/bin:\$PATH" >> /etc/profile
sudo echo "export PATH=\$HADOOP_HOME/sbin:\$PATH" >> /etc/profile

# Normalement pas necessaire (Ci-dessous), si je l'ai mis dans /etc/profile
sudo echo "export HADOOP_HOME=/usr/local/liondoop" >> /home/vagrant/.profile
sudo echo "export PATH=\$HADOOP_HOME/bin:\$PATH" >> /home/vagrant/.profile
sudo echo "export PATH=\$HADOOP_HOME/sbin:\$PATH" >> /home/vagrant/.profile

sudo echo "export HADOOP_HOME=/usr/local/liondoop" >> /home/vagrant/.bashrc
sudo echo "export PATH=\$HADOOP_HOME/bin:\$PATH" >> /home/vagrant/.bashrc
sudo echo "export PATH=\$HADOOP_HOME/sbin:\$PATH" >> /home/vagrant/.bashrc

# Mise en place du path pour pig
sudo echo "export PATH=/usr/local/lionpig/bin/:\$PATH" >> /etc/profile
sudo echo "export PIG_CONF_DIR=/usr/local/conf/pig.properties" >> /etc/profile
sudo echo "export PIG_CONF_DIR=/usr/local/conf/pig.properties" >> /home/vagrant/.profile # NB : Des commandes sont lancés en sudo d'autres pas, selon l'utilisateur à qui appartient le truc
sudo echo "export PIG_CONF_DIR=/usr/local/conf/pig.properties" >> /home/vagrant/.bashrc

#NB : Le choix de HADOOP_HOME --> est pour forcer PIG à choisir ma version de Hadoop - POC sur une version précise de Hadoop

# Violation des droits pour permettre à un utilisation d'exécuter le POC
sudo chmod -Rf 777 /usr/local/liondoop

# A ce niveau Hadoop est installer nous allons vous formattez le namenode
#hadoop namenode -format


