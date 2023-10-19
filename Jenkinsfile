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
        stage('HTML Reports') {
            steps {
               publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '/var/lib/jenkins/workspace/Bankingprj/target/surefire-reports', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: '', useWrapperFileDirectly: true])
            }
        }

    }
}
