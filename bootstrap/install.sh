# Resolution du probleme stdin - Sans trop comprendre pourquoi ? ----
# lien vers la page : http://serverfault.com/questions/500764/dpkg-reconfigure-unable-to-re-open-stdin-no-file-or-directory

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8
dpkg-reconfigure locales

# PREREQUIS DE BASE

sudo add-apt-repository ppa:openjdk-r/ppa -y
sudo apt-get update
sudo apt-get -y install openjdk-8-jdk
sudo update-alternatives --config java

sudo apt-get install -y vim
sudo apt-get install -y ssh
sudo apt-get install -y rsync
sudo apt-get install -y build-essential

# INSTALLATION de Hadoop sur la machine Guest, depuis notre configuration

## Generation de la key ssh -> Pour permettre à localhost de se connecter en ssh
ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa
cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys
#ssh localhost
#exit

## Path pour l'environnement JAVA, (L'utilisateur importe peu pour le POC)
echo "export JAVA_HOME=/usr/java/latest" >> /etc/profile
echo "export PATH=$JAVA_HOME/bin:$PATH" >> /etc/profile

## Path pour l'environnement Hadoop
echo "export HADOOP_INSTALL=/usr/local/liondoop" >> /etc/profile
echo "export PATH=$PATH:$HADOOP_INSTALL/bin" >> /etc/profile
echo "export PATH=$PATH:$HADOOP_INSTALL/sbin" >> /etc/profile

## Mise en place du Framework dans /usr/local
cp -Rf /vagrant/liondoop /usr/local/

# Violation des droits pour permettre à un utilisation d'exécuter le POC