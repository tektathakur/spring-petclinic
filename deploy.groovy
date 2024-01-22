pipeline {
    agent any
    stages {
        stage ('fetch code') {
            steps {
                checkout changelog: false, poll: false, scm: scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/tektathakur/spring-petclinic']])
            }
        }

        stage ('Deploy application') {
            steps {
                sh """
                    cd terraform
                    terraform init
                    terraform plan
                    terraform apply --auto-approve
                """
            }
        }
    }
}

