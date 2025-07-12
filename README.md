# vulcain  

> projet btp Gaetan

## Avant installation  
- Treafik nseven doit etre installé, configuré et lancé  
- Creer des copies `.env` depuis `.env.dist` à l'endroit où sont les `.env.dist`
- renseigner les valeurs `1270.0.0.1  vuclain.local`, `1270.0.0.1  vuclain-api.local`  
dans le fichier `/etc/hosts` (attention utiliser `sudo` pour modifier ce fichier)

## Mode dev  
- lancer la commande `make up`
- accèder aux logs (commande `make logs-api`) de l'api pour voir l'url du swagger  
- voir toutes les commandes disponibles avec `make`

## Fonctionnement fichier `.env`  
- il y a 3 fichiers `.env` :  
  - `.env` : ce fichier à la racine du repo, sert pour le lancement des containeurs docker  
    et contient des infos pour traefik et les ports utilisés par les services (tous les conteneurs)
  - `back/.env` : contient des variable specifiques à l'api
  - `front/.env` : contient des variable specifiques à l'aoolication front end.  

**ATTENTION les variables APP_ENV doivent toutes etre avec la meme valeur**  
