# TP Docker - MongoDB

## Installation Rapide

**Secret :** Créer un fichier `.env` (voir `.env.example`).

**Build :** `docker build -t natounor/mongo-blog:1.0.0 .`

**Run :** `docker run -d --name mon-blog-mongo --env-file .env -p 27017:27017 natounor/mongo-blog:1.0.0`

## Points Clés du TP

**Données & Intégrité :** Création automatique de la base **blog_db** et d'une collection **posts** avec **5 articles de test**.

**Validation de Schéma :** Implémentation d'un **JSON Schema Validator** ; toute insertion de type incorrect est **strictement rejetée** par la base.

**Sécurité :** Utilisation d'une image **UBI** et exécution via un utilisateur **non-privilégié** (non-root).

**Viabilité :** Script de test (**check-status.sh**) pour valider l'accès aux données et l'absence de droits **root**.

## Livrables

**Docker Hub :** https://hub.docker.com/repository/docker/natounor/mongo-blog/general

**Dépôt Git :** Contient le **Dockerfile**, le script **.js**, le script de viabilité et le **README.md**.