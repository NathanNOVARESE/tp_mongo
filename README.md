# TP Docker - MongoDB Blog

## Architecture

```
TP_MONGO/
├── api/                    # Application API FastAPI
│   ├── Dockerfile         # Image Docker personnalisée
│   ├── main.py           # Code source FastAPI
│   └── requirements.txt   # Dépendances Python
├── mongo/                 # Service MongoDB
│   ├── Dockerfile        # Image MongoDB personnalisée
│   └── init-db.js       # Script d'initialisation de la base
├── mysql/                # Service MySQL
│   └── init.sql         # Script d'initialisation
├── scripts/              # Scripts utilitaires
├── docker-compose.yml    # Orchestration des services
├── Dockerfile           # Image principale (si applicable)
├── check-status.ps1    # Script de vérification du statut
├── .env.example        # Modèle de configuration
├── .gitignore          # Exclusions Git
└── README.md           # Cette documentation
```

### Services

| Service | Port | Description |
|---------|------|-------------|
| **API** | 8000 | Application FastAPI |
| **MongoDB** | 27017 | Base de données MongoDB |
| **MySQL** | 3306 | Base de données MySQL |

## Prérequis

- Docker (v20.10+)
- Docker Compose (v2.0+)
- PowerShell 5.1+ (pour les scripts Windows)
- 4GB RAM minimum

## Installation

### 1. Cloner le dépôt

```bash
git clone https://github.com/NathanNOVARESE/tp_mongo
cd tp_mongo
```

### 2. Configurer les variables d'environnement

```bash
# Copier le modèle de configuration
cp .env.example .env

# Éditer .env avec vos paramètres
```

**Variables d'environnement requises :**

```env
MONGO_INITDB_ROOT_USERNAME=admin
MONGO_INITDB_ROOT_PASSWORD=password
DATABASE_NAME=blog_db
COLLECTION_NAME=posts
```

### 3. Démarrer la stack

```bash
# Démarrer tous les services
docker-compose up -d

# Vérifier le statut des services
docker-compose ps
```

### 4. Vérification initiale

```powershell
# Exécuter le script de vérification (Windows)
.\check-status.ps1

# Ou utiliser Docker directement
docker-compose logs mongodb
```

## Utilisation

### Accéder à l'API

L'API FastAPI est disponible sur `http://localhost:8000`

- Documentation interactive (Swagger) : `http://localhost:8000/docs`
- Redoc : `http://localhost:8000/redoc`

### Accéder à MongoDB

```bash
# Via MongoDB CLI
docker-compose exec mongodb mongosh -u admin -p password

# Via Python
from pymongo import MongoClient
client = MongoClient('mongodb://admin:password@localhost:27017/')
db = client['blog_db']
posts = db.posts
```

### Commandes utiles

```bash
# Afficher les logs d'un service
docker-compose logs -f mongodb
docker-compose logs -f api

# Accéder au shell MongoDB
docker-compose exec mongodb mongosh -u admin -p password --authenticationDatabase admin

# Arrêter la stack
docker-compose down

# Supprimer les volumes (attention : données supprimées)
docker-compose down -v

# Reconstruire une image
docker-compose build --no-cache api
```

## Configuration

### Dockerfile MongoDB

- Image de base : **UBI** (Universal Base Image)
- Utilisateur non-privilégié : exécution sans droits **root**
- Variables d'environnement configurables via `.env`

### Dockerfile API

- Framework : **FastAPI**
- Runtime Python : 3.11+
- Dépendances : À définir dans `requirements.txt`

## Points clés du TP

### Données & Intégrité
- Création automatique de la base `blog_db`
- Collection `posts` avec **5 articles de test** initialisés
- Persistance des données avec volumes Docker

### Validation de Schéma
- Implémentation d'un **JSON Schema Validator** MongoDB
- Validation stricte : toute insertion non-conforme est **rejetée** par la base de données
- Schéma défini dans le script d'initialisation

### Sécurité
- Image de base **UBI** (Red Hat Universal Base Image)
- Exécution en tant qu'utilisateur **non-privilégié** (non-root)
- Authentification MongoDB activée par défaut
- Secrets gérés via variables d'environnement `.env`

### Viabilité
- Script de test (`check-status.ps1`) pour valider :
  - Accès aux données
  - Absence de droits `root` dans les conteneurs
  - Santé des services

## Vérification & Validation

### Exécuter le script de vérification

```powershell
# Windows PowerShell
.\check-status.ps1
```

Le script valide :
- ✓ Status des conteneurs
- ✓ Connectivité MongoDB
- ✓ Présence des données de test
- ✓ Permissions utilisateur

### Tests manuels

```bash
# Vérifier les conteneurs
docker-compose ps

# Tester la connectivité MongoDB
docker-compose exec mongodb mongosh -u admin -p password --eval "db.adminCommand('ping')"

# Compter les articles de test
docker-compose exec mongodb mongosh -u admin -p password blog_db --eval "db.posts.countDocuments()"
```

## Ressources

### Documentation officielle
- [Docker Documentation](https://docs.docker.com/)
- [Docker Compose Reference](https://docs.docker.com/compose/reference/)
- [MongoDB Manual](https://docs.mongodb.com/manual/)
- [FastAPI Documentation](https://fastapi.tiangolo.com/)

### Images Docker utilisées
- [MongoDB Official Image](https://hub.docker.com/_/mongo)
- [UBI Red Hat](https://catalog.redhat.com/software/containers/ubi8/ubi/5891ecc46d86140a40374c65)

## Livrables

| Ressource | Lien |
|-----------|------|
| **Docker Hub** | [natounor/mongo-blog](https://hub.docker.com/repository/docker/natounor/mongo-blog/general) |
| **Dépôt Git** | [GitHub - mongo-blog](https://https://github.com/NathanNOVARESE/tp_mongo) |

### Fichiers livrés
- ✓ Dockerfile(s) - Images Docker personnalisées
- ✓ main.py - Application FastAPI
- ✓ init-db.js - Initialisation MongoDB
- ✓ init.sql - Initialisation MySQL
- ✓ docker-compose.yml - Orchestration complète
- ✓ check-status.ps1 - Script de validation
- ✓ README.md - Cette documentation