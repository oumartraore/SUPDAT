SUPDAT - MINI PROJET 5DAT
===================
Ce projet à été généré en utilisant Vagrant. Afin de fournir un environnement Hadoop disponible au correcteur, lui permettant d'exécuter nos scripts PIG. Le but aussi est de maintenir par la suite une sandbox de hadoop (TRAORE Oumar)

> **Version Logiciel:**
> - Devian 7 Wheezy 64 bits **Guest** (Wheezy like Lil wayne)
> - Hadoop 1.2.1
> - OSX EL CAPITAIN **Host** (Des problèmes peuvent survenir sur d'autres plateformes, Attention)
> - Python : Pas besoin de faire du stream ...

----------


Context
-------------

Mini projet permettant de manipuler nos gros fichiers volumineux dans un environnement Hadoop, avec PIG.

> **IMPORTANT:**
> - Le projet se compose en 2 parties distincts.
> - Blabla partie I.
> - Blabla partie II.

----------


EQUIPES
-------------------

NOM      | PRENOM  		| IDBooster
-------- | -----------|-----------
TRAORE   | Oumar   		| 165366
BOYER    | Clement 		| 159913
BOMO     | NGABA Xavier | 216113  


> **Rôle:**
> - **TRAORE Oumar** : Installation de l'infrastructure Hadoop, Gestion du projet.
> - **BOYER Clement** : Partie I.
> - **BOMO NGABA Xavier** : Partie II.


----------


PREREQUIS
-------------

Vous devez avoir ces prérequis

- ```vagrant```  Téléchargeable depuis https://www.vagrantup.com/
- ```virtualbox``` Téléchargeable depuis https://www.virtualbox.org/
- ```Memoire RAM``` 1024 MB
- ```Memoire Physique```20 GB


----------


INSTALLATION
-------------
Executer ces commandes depuis votre terminal

- ```vagrant up```  Demarrer la VM
- ```vagrant ssh``` Connexion à la VM --> Machine Guest (Vous êtes sur la machine Guest à ce niveau)
- ```hadoop namenode -format```  Formater le namenode
- ```start-all.sh``` Lancement des deamons HDFS & Mapreduce en mode Pseudo Distribué, sur un noeud (Suffisant pour PIG, dans ce POC), Mot de Passe "vagrant". l'idée est de permettre à l'utilisateur de lancer & éteindre le demon à volonté, sans l'automatisation
- ```pig -x mapreduce```  Pour le lancer pig en mode Mapreduce, pour tester (Demande dans le sujet)



----------


DEPLOIEMENT (TEST || DEMO || ...)
-------------

Depuis la machine **Hôte**, sur votre Navigateur

- ```http://localhost:50070``` Interface du NameNode
- ```http://localhost:50030``` Interface du JobTracker

Depuis la machine **Guest** sur votre terminer, executer
 
- ```cd /vagrant``` Pour accerder au repertoire partager, contenant les sources à réaliser
- ```hadoop fs -put liondata liondata``` Copiez les fichiers sur HDFS, dans un dossier liondata
- ```pig -x mapreduce Partie-I/scriptX.pig``` X: [1..5] Repeter cette action, pour chaque script à tester de la Partie I
- ```pig -x mapreduce Partie-II/scriptX.pig``` X: [1..5] Repeter cette action, pour chaque script à tester de la Partie II


> **Avantage:**
Tout le traitement est effectuer par PIG dans Hadoop & le paradigme Mapreduce, permettra d'acceler le calcul, les performances sont réellement visible sur un grand cluster.


> **IMPORTANT:**

> - A l'attention du **Correcteur**, il n'est pas nécessaire d'exécuter l'environnement, vous pouvez immédiatement consulter le résultat attendu dans le dossier source "src" présent à la racine de l'archive.


Fin du Prof of concept du projet 5DAT.
