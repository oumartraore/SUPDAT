SUPDAT - MINI PROJET 5DAT
===================
Ce projet à été généré en utilisant Vagrant. Afin de fournir un environnement Hadoop disponible au correcteur, lui permettant d'exécuter nos scripts PIG.

----------


Context
-------------

Mini projet permettant de manipuler nos gros fichiers volumineux dans un environnement Hadoop, avec PIG.

> **IMPORTANR:**

> - Le projet se compose de 2 parties distincts.
> - Blabla partie I.
> - Blabla partie II.

----------


EQUIPES
-------------------

NOM      | PRENOM  		| IDBooster
-------- | ------------ |-----------
TRAORE   | Oumar   		| 165366
BOYER    | Clement 		| 159913
BOMO     | NGABA Xavier | 216113  


> **Rôle:**

> - **TRAORE Oumar** Installation de l'infrastructure Hadoop + PIG.
> - **BOYER Clement** Partie I.
> - **BOMO NGABA Xavier** Partie II.



----------


PREREQUIS
-------------

Vous devez avoir ces prérequis

- ```vagrant```  https://www.vagrantup.com/
- ```virtualbox``` https://www.virtualbox.org/
- ```Memoire RAM``` 1024 MB
- ```Memoire Physique```20 GB
- ```http://localhost:50070``` Interface du NameNode
- ```http://localhost:50090``` Interface du JobTracker




----------


INSTALLATION
-------------
Executer ces commandes depuis votre terminal

- ```vagrant up```  Demarrer la VM
- ```vagrant ssh``` Connexion à la VM
- ```start-all.sh``` Lancement de Hadoop en mode single node
- ```cd /vagrant && pig.sh```Lancement de la démo du projet

> **IMPORTANR:**

> - A l'attention du correcteur, il n'est pas nécessaire d'exécuter l'environnement, vous pouvez immédiatement consulter le résultat attendu dans le dossier source "src" présent à la racine.

Fin du Prof of concept du projet 5DAT.
