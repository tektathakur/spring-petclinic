pipeline {
    agent none
    tools {
        maven 'maven-3.5.2'
    }
    stages {
        stage ('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage ('docker image') {
            agent { dockerfile true }
            steps {
                sh """
                gcloud auth login
                gcloud auth configure-docker
                
                docker build -t gcr.io/dotted-byway-411905/spring-petclinic:latest .
                docker push gcr.io/dotted-byway-411905/spring-petclinic:latest
            """
            }
        }
    }
}

