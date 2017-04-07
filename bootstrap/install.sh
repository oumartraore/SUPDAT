if which java > /dev/null
then
    echo 'skip java 8 installation'
else
    echo 'installing java 8'
    apt-get install --yes python-software-properties
    apt-get install --reinstall ca-certificates
    sudo -E add-apt-repository ppa:webupd8team/java
    apt-get update -qq
    echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
    echo debconf shared/accepted-oracle-license-v1-1 seen true | /usr/bin/debconf-set-selections
    apt-get install --yes oracle-java8-installer
    yes "" | apt-get -f install
fi

if which mvn > /dev/null
then
    echo "skip maven installation"
else
    echo "installing mvn"
    cd /usr/local
    wget http://apache.crihan.fr/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
    tar xzf apache-maven-3.3.9-bin.tar.gz
    rm apache-maven-3.3.9-bin.tar.gz
    mv apache-maven-3.3.9 maven
    ln -s /usr/local/maven/bin/mvn /usr/local/bin/mvn
fi

if which spring > /dev/null
then
    echo 'skip spring-cli installation'
else
    echo 'installing spring-cli'
    cd /usr/local
    wget http://repo.spring.io/release/org/springframework/boot/spring-boot-cli/1.3.3.RELEASE/spring-boot-cli-1.3.3.RELEASE-bin.tar.gz
    tar xzf spring-boot-cli-1.3.3.RELEASE-bin.tar.gz
    rm spring-boot-cli-1.3.3.RELEASE-bin.tar.gz
    mv spring-1.3.3.RELEASE spring-boot-cli
    ln -s /usr/local/spring-boot-cli/bin/spring /usr/local/bin/spring
fi
	
if which mysql > /dev/null
then
  echo 'skip mysql installation'
else
  echo 'installing mysql'
  sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
  sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
  sudo apt-get -y install mysql-server
fi


if which node > /dev/null
then
    echo 'skip node, npm, yo, gulp and jhipster installation'
else 
    # install node
    wget -qO- https://deb.nodesource.com/setup_6.x | sudo bash -
    sudo apt-get install -y nodejs g++ build-essential unzip git

    # update npm
    sudo npm install -g npm

    # install yeoman grunt bower gulp
    sudo npm install -g yo bower gulp
    
    # install JHipster
    sudo npm install -g generator-jhipster@3.6.1

    # install JHipster UML
    sudo npm install -g jhipster-uml@1.6.5
fi
