# Instrucciones para levantar el proyecto

Para levantar el proyecto, siga los siguientes pasos:

1. Inicie Minikube:
    ```bash
    minikube start
    ```

2. Aplique la configuración del despliegue:
    ```bash
    kubectl apply -f ./deployment.yaml
    ```

3. Inicie el túnel de Minikube en segundo plano:
    ```bash
    minikube tunnel &
    ```

4. Exponga el despliegue `todo-app` como un LoadBalancer en el puerto 3000:
    ```bash
    kubectl expose deployment todo-app --type=LoadBalancer --port=3000
    ```
