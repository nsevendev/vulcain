# vulcain  

> projet btp Gaetan

## Avant installation  
- Treafik nseven doit etre installé, configuré et lancé  
- Creer des copies `.env` depuis `.env.dist` à l'endroit où sont les `.env.dist`
- renseigner les valeurs `1270.0.0.1  vuclain.local`, `1270.0.0.1  vuclain-api.local`  
dans le fichier `/etc/hosts` (attention utiliser `sudo` pour modifier ce fichier)

## Mode dev  
- lancer la commande `make up`
- accèder aux logs (commande `make logs-api`) de l'api pour voir l'url du swagger ou l'url de l'api  
- accèder aux logs (commande `make logs-front`) de l'application front end pour voir l'url de l'application  
- accèder à l'application front end à l'adresse `https://vulcain.local`  
- voir toutes les commandes disponibles avec `make`  
