# TP Docker - MongoDB
## Installation Rapide

**Secret :** Créer un fichier `.env` (voir `.env.example`).

**Build :** `docker build -t natounor/mongo-blog:1.0.0 .`

**Run :** `docker run -d --name mon-blog-mongo --env-file .env -p 27017:27017 natounor/mongo-blog:1.0.0`