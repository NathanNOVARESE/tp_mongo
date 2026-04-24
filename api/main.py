import mysql.connector
import os
from fastapi import FastAPI, HTTPException
from motor.motor_asyncio import AsyncIOMotorClient

app = FastAPI()

# Configuration via variables d'environnement [cite: 71]
MONGO_URL = os.getenv("MONGO_URL")
MYSQL_CONFIG = {
    "host": "db_mysql",
    "user": "root",
    "password": os.getenv("MYSQL_ROOT_PASSWORD"),
    "database": os.getenv("MYSQL_DATABASE")
}

# Route MongoDB [cite: 70]
@app.get("/posts")
async def get_posts():
    client = AsyncIOMotorClient(MONGO_URL)
    db = client.blog_db
    cursor = db.posts.find({}, {"_id": 0})
    return await cursor.to_list(length=100)

# Route MySQL [cite: 70]
@app.get("/users")
def get_users():
    try:
        conn = mysql.connector.connect(**MYSQL_CONFIG)
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM utilisateurs")
        users = cursor.fetchall()
        conn.close()
        return users
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

# Healthcheck métier de l'API [cite: 63, 64]
@app.get("/health")
async def health():
    # Logique pour vérifier si /posts et /users répondent
    return {"status": "OK"}