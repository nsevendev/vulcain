# vulcain  

> projet btp Gaetan

## Avant installation en mode dev  
- Treafik nseven doit etre installé, configuré et lancé  
- Creer des copies `.env` depuis `.env.dist` à l'endroit où sont les `.env.dist`
- renseigner les valeurs `1270.0.0.1  vuclain.local`, `1270.0.0.1  vuclain-api.local`  
dans le fichier `/etc/hosts` (attention utiliser `sudo` pour modifier ce fichier)

## Avant d'installer en mode prod ou preprod
- pareil que le mode dev, sauf que les variables dans les `.env` doivent etre renseigner pour la production

## Mode dev  
- lancer la commande `make up`
- accèder aux logs (commande `make logs-api`) de l'api pour voir l'url du swagger ou l'url de l'api  
- accèder aux logs (commande `make logs-front`) de l'application front end pour voir l'url de l'application  
- accèder à l'application front end à l'adresse `https://vulcain.local`  
- voir toutes les commandes disponibles avec `make`  

## Mode prod ou preprod   
- mettre les variables des `.env` `APP_ENV=prod` ou `APP_ENV=preprod`
- lancer les commandes comme pour le mode dev, mais renseigner les variables d'environement pour la prod ou preprod
