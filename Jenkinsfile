pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/arman-cpu/Bankingfinance.git'
            }
        }
        stage('Build Package') {
            steps {
                sh 'mvn clean package'
            }
        }

    }
}
