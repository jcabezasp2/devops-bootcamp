# Instrucciones para levantar el proyecto

1. Iniciar Minikube:
    ```bash
    minikube start
    ```

2. Acceder a la máquina virtual de Minikube y configurar el directorio de datos:
    ```bash
    minikube ssh
    sudo mkdir -p /mnt/data
    sudo chmod 777 /mnt/data
    exit
    ```

3. Desplegar la base de datos:
    ```bash
    kubectl apply -f db/configmap.yaml
    kubectl apply -f db/configmap-init.yaml
    kubectl apply -f db/storageclass.yaml
    kubectl apply -f db/persistentvolume.yaml
    kubectl apply -f db/persistentvolumeclaim.yaml
    kubectl apply -f db/service.yaml
    kubectl apply -f db/statefulset.yaml
    ```

4. Inicializar la base de datos:
    ```bash
    kubectl exec -it postgres-0 -- psql -U postgres -d todos_db -f /docker-entrypoint-initdb.d/init.sql
    ```

5. Desplegar la aplicación:
    ```bash
    kubectl apply -f app/configmap.yaml
    kubectl apply -f app/deployment.yaml
    ```

6. Configurar el LoadBalancer:
    ```bash
    minikube tunnel &
    kubectl expose deployment todo-app --type=LoadBalancer --port=3000
    ```
