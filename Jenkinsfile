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
                sh 'terraform init -upgrade'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -var "subscription_id=$AZ_SUBSCRIPTION_ID" -var "location=West US" -var "resource_group_name=kml_rg_main-22e8cb42c6144bfc"'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve -var "subscription_id=$AZ_SUBSCRIPTION_ID" -var "location=West US" -var "resource_group_name=kml_rg_main-22e8cb42c6144bfc"'
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
