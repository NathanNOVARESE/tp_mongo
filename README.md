# TP Docker - MongoDB

## Installation Rapide

**Secret :** Créer un fichier `.env` (voir `.env.example`).

**Build :** `docker build -t natounor/mongo-blog:1.0.0 .`

**Run :** `docker run -d --name mon-blog-mongo --env-file .env -p 27017:27017 natounor/mongo-blog:1.0.0`

## Livrables

**Docker Hub :** https://hub.docker.com/repository/docker/natounor/mongo-blog/general 

**Dépôt Git :** Contient le Dockerfile, le script .js, le script Bash/PS1, le README.md, ainsi que les 4 captures d'écran demandé 