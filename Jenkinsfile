pipeline {
    agent none
    environment {
        MY127WS_KEY = credentials('base-my127ws-key-20190523')
    }
    triggers { cron(env.BRANCH_NAME == 'master' ? 'H H(0-6) * * *' : '') }
    stages {
        stage('Test Matrix') {
            parallel {
                stage('(mode=production)') {
                    agent { label "my127ws" } 
                    steps { sh './test production' }
                }
                stage('(mode=develop)') {
                    agent { label "my127ws" } 
                    steps { sh './test develop' }
                }
            }
        }
    }
}
