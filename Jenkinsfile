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
        stage('Build docker image') {
            steps {
                sh 'docker build -t arman23/bankingpro:1.0 .'
            }
        }
         stage('Build Push Image') {
            steps {
               withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'password', usernameVariable: 'docker_login')]) {
                sh 'docker login -u  ${docker_login} -p ${password}'
                }
                sh 'docker push arman23/bankingpro:1.0'
            }
        }

    }
}
