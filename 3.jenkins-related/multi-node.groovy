pipeline {
    agent none 
    stages {
        stage('Master') {
            agent{
                label 'master'
            }
            steps {
            echo "Hello I am master "

               sh """
               curl ifconfig.me
            
               """
            }
        }

        stage("Worker01"){
            agent {
                label 'new-agent'
            }
            steps{
                echo "Hello I am worker "
                sh """
                curl ifconfig.me 
                """
            }
        }
    }
}