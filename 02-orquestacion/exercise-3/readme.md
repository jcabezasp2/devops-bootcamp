# Instrucciones para levantar el proyecto

1. Iniciar Minikube:
   ```bash
   minikube start
   ```

2. Habilitar el complemento de Ingress en Minikube:
   ```bash
   minikube addons enable ingress
   ```

3. Desplegar el frontend:
   ```bash
   kubectl apply -f front/deployment.yaml
   ```

4. Desplegar la API:
   - ConfigMap:
     ```bash
     kubectl apply -f api/configmap.yaml
     ```
   - Deployment:
     ```bash
     kubectl apply -f api/deployment.yaml
     ```

5. Crear un túnel para Ingress:
   ```bash
   minikube tunnel &
   ```

6. Aplicar la configuración de Ingress:
   ```bash
   kubectl apply -f ingress.yaml
   ```
