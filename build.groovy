pipeline {
    agent any
    tools {
        maven 'maven-3.5.2'
    }
    stages {

        stage ('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage ('Build & Push docker image') {
            steps {
                sh """
                    docker build -t tektathakur/docker-images:spring-petclinic .
                    docker push tektathakur/docker-images:spring-petclinic
                """
            }
        }
    }
}

