pipeline {
    agent none

    options {
        skipDefaultCheckout()
    }

    stages {
        stage('Checkout') {
            agent any
            steps {
                git branch: 'main',
                    url: 'https://github.com/jcabezasp2/calculator2.git'
            }
        }

        stage('Build & Test') {
            agent {
                docker {
                    image 'gradle:6.6.1-jre14-openj9'
                    reuseNode true
                }
            }
            steps {
                sh 'gradle compileJava'
                sh 'gradle test'
            }
        }
    }
}