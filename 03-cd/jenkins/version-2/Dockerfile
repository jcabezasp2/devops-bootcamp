FROM jenkins/jenkins:lts

USER root

# Instalar dependencias necesarias
RUN apt-get update && \
    apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release && \
    rm -rf /var/lib/apt/lists/*

# Configurar el repositorio de Docker
RUN mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Instalar Docker
RUN apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin && \
    rm -rf /var/lib/apt/lists/*

# Añadir jenkins al grupo docker
RUN groupadd docker || true && \
    usermod -aG docker jenkins

USER jenkins

# Instalar plugins necesarios
RUN jenkins-plugin-cli --plugins \
    docker-workflow \
    docker-plugin \
    git