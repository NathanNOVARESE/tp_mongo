FROM mongodb/mongodb-community-server:6.0-ubi8
COPY mongo/init-db.js /docker-entrypoint-initdb.d/
EXPOSE 3306
