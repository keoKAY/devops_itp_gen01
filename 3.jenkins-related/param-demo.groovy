pipeline {
    agent any

    stages {

        stage('Run Rest') {
            when {
                expression { 
                    param.RUN_TEST==true
                }
            }
            steps {
                echo 'Test is running' 
                
            }
        }
        stage("Deploy Code"){
            steps{
                echo "Deploying code directly"
            }
}    }
}
