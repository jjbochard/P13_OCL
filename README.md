## Résumé

Site web d'Orange County Lettings

## Développement local

### Prérequis

- Compte GitHub avec accès en lecture à ce repository
- Git CLI
- SQLite3 CLI
- Interpréteur Python, version 3.6 ou supérieure

Dans le reste de la documentation sur le développement local, il est supposé que la commande `python` de votre OS shell exécute l'interpréteur Python ci-dessus (à moins qu'un environnement virtuel ne soit activé).

### macOS / Linux

#### Cloner le repository

- `cd /path/to/put/project/in`
- `git clone https://github.com/OpenClassrooms-Student-Center/Python-OC-Lettings-FR.git`

#### Créer l'environnement virtuel

- `cd /path/to/Python-OC-Lettings-FR`
- `python -m venv venv`
- `apt-get install python3-venv` (Si l'étape précédente comporte des erreurs avec un paquet non trouvé sur Ubuntu)
- Activer l'environnement `source venv/bin/activate`
- Confirmer que la commande `python` exécute l'interpréteur Python dans l'environnement virtuel
`which python`
- Confirmer que la version de l'interpréteur Python est la version 3.6 ou supérieure `python --version`
- Confirmer que la commande `pip` exécute l'exécutable pip dans l'environnement virtuel, `which pip`
- Pour désactiver l'environnement, `deactivate`

#### Exécuter le site

- `cd /path/to/Python-OC-Lettings-FR`
- `source venv/bin/activate`
- `pip install --requirement requirements.txt`
- `python manage.py runserver`
- Aller sur `http://localhost:8000` dans un navigateur.
- Confirmer que le site fonctionne et qu'il est possible de naviguer (vous devriez voir plusieurs profils et locations).

#### Linting

- `cd /path/to/Python-OC-Lettings-FR`
- `source venv/bin/activate`
- `flake8`

#### Tests unitaires

- `cd /path/to/Python-OC-Lettings-FR`
- `source venv/bin/activate`
- `pytest`

#### Base de données

- `cd /path/to/Python-OC-Lettings-FR`
- Ouvrir une session shell `sqlite3`
- Se connecter à la base de données `.open oc-lettings-site.sqlite3`
- Afficher les tables dans la base de données `.tables`
- Afficher les colonnes dans le tableau des profils, `pragma table_info(Python-OC-Lettings-FR_profile);`
- Lancer une requête sur la table des profils, `select user_id, favorite_city from
  Python-OC-Lettings-FR_profile where favorite_city like 'B%';`
- `.quit` pour quitter

#### Panel d'administration

- Aller sur `http://localhost:8000/admin`
- Connectez-vous avec l'utilisateur `admin`, mot de passe `Abc1234!`

### Windows

Utilisation de PowerShell, comme ci-dessus sauf :

- Pour activer l'environnement virtuel, `.\venv\Scripts\Activate.ps1` 
- Remplacer `which <my-command>` par `(Get-Command <my-command>).Path`

## Déploiement

Le déploiement suit un workflow CI/CD via CircleCI suivant les étapes suivantes:

- Le code est testé avec `flake8` et les tests sont effectués
- Un build de l'image est effectué et cette image est envoyé vers `Docker Hub` (`https://hub.docker.com/repository/docker/jeremybochard/ocl`)
- un container docker est en suite envoyé vers heroku pour le déploiement de l'application (`oc-lettings-987.herokuapp.com`)

Le workflow complet est lancé à chaque push sur master. Sur les autres branches, juste la première étapes est effectuée.

Il est configuré dans le fichier `.circleci/config.yml`


Sentry a été configuré pour pouvoir monitorer l'application et de suivre les erreurs
### Configuration

1. Installer [Docker](https://www.docker.com/)
2. Créer un repo sur [Docker Hub](https://hub.docker.com/)
3. Créer un compte [Sentry](https://sentry.io/signup/)
4. Créer un projet Django dans Sentry
5. Noter votre clé DSN pour ce projet
6. Créer un compte sur [Heroku](https://www.heroku.com/home)
    - Soit via le site
    - Soit la console :
        ```
        heroku login
        heroku create $APP_NAME
        ```
7. Dans les paramètres, ajouter les variables suivantes sur Heroku:
    - DJANGO_SECRET_KEY
    - SENTRY_DSN_KEY
8. Créer un compte [circleci](https://circleci.com/)
9. Choisir un projet Github et ajouter les variables suivantes : 
    - DOCKER_USER
    - DOCKER_PASSWORD
    - HEROKU_TOKEN
    - HEROKU_APP_NAME
    - DJANGO_SECRET_KEY
    - SENTRY_DSN_KEY
10. Déployer votre code
    ````
    heroku push heroku main
    ````
11. Vérifier qu'une instance de l'application tourne
    ````
    heroku ps:scale web=1 -a $APPNAME
    ````
12. Ouvrir votre application
    ````
    heroku open -a $APPNAME
    ````

### Lien de l'application pour le passage du jury

https://ocl0987.herokuapp.com/
