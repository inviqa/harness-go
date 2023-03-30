pipeline {
    agent none
    environment {
        MY127WS_KEY = credentials('base-my127ws-key-20190523')
    }
    triggers { cron(env.BRANCH_NAME == 'master' ? 'H H(2-6) * * 1' : '') }
    stages {
        stage('Test Matrix') {
            parallel {
                stage('(go=1.19 mode=production)') {
                    agent { label 'linux-amd64' }
                    steps { sh './test production 1.19' }
                }
                stage('(go=1.19 mode=production-multiplatform)') {
                    agent { label 'linux-amd64' }
                    steps { sh './test production-multiplatform 1.19' }
                }
                stage('(go=1.19 mode=develop-with-mysql)') {
                    agent { label 'linux-amd64' }
                    steps { sh './test develop-with-mysql 1.19' }
                }
                stage('(go=1.19 mode=develop-with-postgres)') {
                    agent { label 'linux-amd64' }
                    steps { sh './test develop-with-postgres 1.19' }
                }
                stage('(go=1.19 mode=develop-with-kafka)') {
                    agent { label 'linux-amd64' }
                    steps { sh './test develop-with-kafka 1.19' }
                }
                stage('(go=1.20 mode=production)') {
                    agent { label 'linux-amd64' }
                    steps { sh './test production 1.20' }
                }
                stage('(go=1.20 mode=production-multiplatform)') {
                    agent { label 'linux-amd64' }
                    steps { sh './test production-multiplatform 1.20' }
                }
                stage('(go=1.20 mode=develop-with-mysql)') {
                    agent { label 'linux-amd64' }
                    steps { sh './test develop-with-mysql 1.20' }
                }
                stage('(go=1.20 mode=develop-with-postgres)') {
                    agent { label 'linux-amd64' }
                    steps { sh './test develop-with-postgres 1.20' }
                }
                stage('(go=1.20 mode=develop-with-kafka)') {
                    agent { label 'linux-amd64' }
                    steps { sh './test develop-with-kafka 1.20' }
                }
            }
        }
    }
}
