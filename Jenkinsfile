pipeline {
    agent none
    environment {
        MY127WS_KEY = credentials('base-my127ws-key-20190523')
    }
    triggers { cron(env.BRANCH_NAME == 'master' ? 'H H(0-6) * * *' : '') }
    stages {
        stage('Test Matrix') {
            parallel {
                stage('(go=1.16 mode=production)') {
                    agent { label 'linux-amd64' }
                    steps { sh './test production 1.16' }
                }
                stage('(go=1.16 mode=develop-with-mysql)') {
                    agent { label 'linux-amd64' }
                    steps { sh './test develop-with-mysql 1.16' }
                }
                stage('(go=1.16 mode=develop-with-postgres)') {
                    agent { label 'linux-amd64' }
                    steps { sh './test develop-with-postgres 1.16' }
                }
                stage('(go=1.16 mode=develop-with-kafka)') {
                    agent { label 'linux-amd64' }
                    steps { sh './test develop-with-kafka 1.16' }
                }
                stage('(go=1.17 mode=production)') {
                    agent { label 'linux-amd64' }
                    steps { sh './test production 1.17' }
                }
                stage('(go=1.17 mode=production-multiplatform)') {
                    agent { label 'linux-amd64' }
                    steps { sh './test production-multiplatform 1.17' }
                }
                stage('(go=1.17 mode=develop-with-mysql)') {
                    agent { label 'linux-amd64' }
                    steps { sh './test develop-with-mysql 1.17' }
                }
                stage('(go=1.17 mode=develop-with-postgres)') {
                    agent { label 'linux-amd64' }
                    steps { sh './test develop-with-postgres 1.17' }
                }
                stage('(go=1.17 mode=develop-with-kafka)') {
                    agent { label 'linux-amd64' }
                    steps { sh './test develop-with-kafka 1.17' }
                }
                stage('(go=1.18 mode=production)') {
                    agent { label 'linux-amd64' }
                    steps { sh './test production 1.18' }
                }
                stage('(go=1.18 mode=production-multiplatform)') {
                    agent { label 'linux-amd64' }
                    steps { sh './test production-multiplatform 1.18' }
                }
                stage('(go=1.18 mode=develop-with-mysql)') {
                    agent { label 'linux-amd64' }
                    steps { sh './test develop-with-mysql 1.18' }
                }
                stage('(go=1.18 mode=develop-with-postgres)') {
                    agent { label 'linux-amd64' }
                    steps { sh './test develop-with-postgres 1.18' }
                }
                stage('(go=1.18 mode=develop-with-kafka)') {
                    agent { label 'linux-amd64' }
                    steps { sh './test develop-with-kafka 1.18' }
                }
            }
        }
    }
}
