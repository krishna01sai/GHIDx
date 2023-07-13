pipeline {
    agent any

    environment {
        BUILD_NUMBER = env.BUILD_NUMBER
        RUN_ARTIFACT_DIR = "tests/${BUILD_NUMBER}"
        SFDC_USERNAME = "krishna01sai@gmail.com"
        HUB_ORG = env.HUB_ORG_DH
        SFDC_HOST = env.SFDC_HOST_DH
        JWT_KEY_CRED_ID = env.JWT_CRED_ID_DH
        CONNECTED_APP_CONSUMER_KEY = env.CONNECTED_APP_CONSUMER_KEY_DH
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/your/repository.git'
            }
        }
        
        stage('Build') {
            steps {
                script {
                    def toolbelt = tool 'salesforce-cli'
                    def sfdx = "${toolbelt}/sfdx"
                    
                    sh "${sfdx} force:auth:jwt:grant --client-id ${CONNECTED_APP_CONSUMER_KEY} --username ${HUB_ORG} --jwt-key-file ${JWT_KEY_CRED_ID} --set-default-dev-hub --instance-url ${SFDC_HOST}"
                    sh "${sfdx} force:source:deploy -u ${HUB_ORG} -p force-app/"
                }
            }
        }
        
        stage('Test') {
            steps {
                script {
                    def toolbelt = tool 'salesforce-cli'
                    def sfdx = "${toolbelt}/sfdx"
                    
                    sh "${sfdx} force:apex:test:run -u ${HUB_ORG} -c -w 5"
                }
            }
        }
        
        stage('Deploy') {
            steps {
                script {
                    def toolbelt = tool 'salesforce-cli'
                    def sfdx = "${toolbelt}/sfdx"
                    
                    sh "${sfdx} force:auth:jwt:grant --client-id ${CONNECTED_APP_CONSUMER_KEY} --username ${SFDC_USERNAME} --jwt-key-file ${JWT_KEY_CRED_ID} --set-default-dev-hub --instance-url ${SFDC_HOST}"
                    sh "${sfdx} force:source:deploy -u ${SFDC_USERNAME} -p force-app/"
                }
            }
        }
    }
    
    post {
        always {
            script {
                junit 'test-result/*.xml'
            }
        }
    }
}
