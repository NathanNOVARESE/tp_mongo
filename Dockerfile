FROM mongodb/mongodb-community-server:6.0-ubi8
COPY init-db.js /docker-entrypoint-initdb.d/
