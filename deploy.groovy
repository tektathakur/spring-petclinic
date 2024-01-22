pipeline {
    agent any
    stages {
       /* stage ('fetch docker image') {
            steps {

            }
        }*/

        stage ('Deploy application') {
            steps {
                sh """
                        terraform init
                        terraform plan
                        terraform apply
                """
            }
        }
    }
}

