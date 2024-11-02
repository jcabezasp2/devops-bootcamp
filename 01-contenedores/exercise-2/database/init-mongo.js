db = connect("localhost:27017/TopicstoreDb");  // Conecta y crea la base de datos si no existe
db.createCollection("Topics");  // Crea la colección Topics si no existe

db.Topics.insertMany([
  {
    "_id": ObjectId("5fa2ca6abe7a379ec4234883"),
    "topicName": "Contenedores"
  },
  {
    "_id": ObjectId("5fa2ca6abe7a379ec4234884"),
    "topicName": "Docker"
  },
  {
    "_id": ObjectId("5fa2ca6abe7a379ec4234885"),
    "topicName": "Podman"
  },
  {
    "_id": ObjectId("5fa2ca6abe7a379ec4234886"),
    "topicName": "Kubernetes"
  }
]);  // Inserta los documentos iniciales en la colección