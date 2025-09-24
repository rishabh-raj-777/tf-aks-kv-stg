pipeline {
    agent any

    environment {
        AZ_SUBSCRIPTION_ID = credentials('azure_subscription_id')
        AZ_CLIENT_ID       = credentials('azure_client_id')
        AZ_CLIENT_SECRET   = credentials('azure_client_secret')
        AZ_TENANT_ID       = credentials('azure_tenant_id')
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/rishabh-raj-777/tf-aks-kv-stg.git'
            }
        }

        stage('Terraform Init') {
            steps {
                bat 'terraform init -upgrade'
            }
        }

        stage('Terraform Plan') {
            steps {
                bat '''
                terraform plan ^
                  -var "subscription_id=%AZ_SUBSCRIPTION_ID%" ^
                  -var "location=West US" ^
                  -var "resource_group_name=kml_rg_main-9630e047037145ea"
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                bat '''
                terraform apply -auto-approve ^
                  -var "subscription_id=%AZ_SUBSCRIPTION_ID%" ^
                  -var "location=West US" ^
                  -var "resource_group_name=kml_rg_main-9630e047037145ea"
                '''
            }
        }
    }

    post {
        success {
            echo 'Terraform deployment completed successfully!'
        }
        failure {
            echo 'Terraform deployment failed.'
        }
    }
}
