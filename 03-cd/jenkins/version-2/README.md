# Configuración de Jenkins con Docker-in-Docker

## Prerrequisitos
- Docker instalado en el host
- Puertos 8080 y 50000 disponibles

## Pasos de instalación
```

1. Construir la imagen de Jenkins con Docker:
```bash
docker build -t jenkins:dind .
```

2. Crear red de Docker:
```bash
docker network create jenkins
```

3. Ejecutar contenedor Docker-in-Docker:
```bash
docker run --name jenkins-docker --rm --detach \
  --privileged --network jenkins --network-alias docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume jenkins-docker-certs:/certs/client \
  --volume jenkins-data:/var/jenkins_home \
  docker:dind
```

4. Ejecutar Jenkins con soporte Docker:
```bash
docker run --name jenkins --detach \
  --network jenkins \
  --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client \
  --env DOCKER_TLS_VERIFY=1 \
  --env JAVA_OPTS="-Dhudson.plugins.git.GitSCM.ALLOW_LOCAL_CHECKOUT=true" \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  --publish 8080:8080 \
  --publish 50000:50000 \
  jenkins:dind
```

5. Obtener contraseña inicial:
```bash
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```



### Prueba de ejecución del jenkinsfile
![alt text](./Captura%20de%20pantalla%202025-03-30%20145048.png)