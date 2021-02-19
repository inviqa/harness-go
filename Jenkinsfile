pipeline {
    agent none
    environment {
        MY127WS_KEY = credentials('base-my127ws-key-20190523')
    }
    triggers { cron(env.BRANCH_NAME == 'master' ? 'H H(0-6) * * *' : '') }
    stages {
        stage('Test Matrix') {
            parallel {
                stage('(go=1.15 mode=production)') {
                    agent { label "my127ws" } 
                    steps { sh './test production 1.15' }
                }
                stage('(go=1.15 mode=develop)') {
                    agent { label "my127ws" }
                    steps { sh './test develop 1.15' }
                }
                stage('(go=1.16 mode=production)') {
                    agent { label "my127ws" }
                    steps { sh './test production 1.16' }
                }
                stage('(go=1.16 mode=develop)') {
                    agent { label "my127ws" }
                    steps { sh './test develop 1.16' }
                }
            }
        }
    }
}
