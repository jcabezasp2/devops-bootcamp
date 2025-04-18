# Workflow CD para el proyecto de Frontend

## Descripción

Se ha creado un workflow de **GitHub Actions** para el proyecto de frontend.  
Este workflow automatiza la construcción y publicación de la imagen Docker del frontend en el **GitHub Container Registry**.

---

## Ejecución del Workflow

El workflow aparece en la pestaña **Actions** del repositorio:

![Ejecución del workflow en Actions](image.png)

Por defecto, la imagen se construye y publica con el tag `latest`, aunque es posible cambiar el tag según la configuración del workflow:

![Selección de tag](image-1.png)

---

## Creación y publicación de la imagen

Al ejecutarse el workflow, se crea una imagen Docker del frontend:

![Creación de la imagen - paso 1](image-2.png)
![Creación de la imagen - paso 2](image-3.png)
![Creación de la imagen - paso 3](image-4.png)

---

## Visualización en GitHub Container Registry

La imagen generada puede ser consultada en el **GitHub Container Registry** asociado al repositorio:

![Imagen en el registry - vista 1](image-5.png)
![Imagen en el registry - vista 2](image-6.png)