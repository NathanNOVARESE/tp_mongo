db = db.getSiblingDB('blog_db');

db.createCollection('posts', {
   validator: {
      $jsonSchema: {
         bsonType: "object",
         required: ["titre", "auteur", "vues"],
         properties: {
            titre: { bsonType: "string", description: "doit être une chaîne" },
            auteur: { bsonType: "string", description: "doit être une chaîne" },
            vues: { bsonType: "int", description: "doit être un entier" }
         }
      }
   }
});

db.posts.insertMany([
   { titre: "Article 1", auteur: "Jean", vues: 10 },
   { titre: "Article 2", auteur: "Alice", vues: 55 },
   { titre: "Article 3", auteur: "Bob", vues: 23 },
   { titre: "Article 4", auteur: "Eve", vues: 102 },
   { titre: "Article 5", auteur: "Charlie", vues: 7 }
]);