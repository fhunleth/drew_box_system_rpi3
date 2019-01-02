pipeline {
    agent any

    environment {
        GITHUB_TOKEN = '62886b1e475cf9d39c670a109e0ea29cceca9641'
        USERNAME = 'laibulle'
        REPO = 'excrement_system_rpi3'
    }

    stages {
        stage('Build') {
            options { 
                disableConcurrentBuilds()
                timeout(time: 3, unit: 'HOURS')
            }
            steps {
                sh "mix deps.get || exit 0"
                sh "chmod +x build.sh || exit 0"
                sh './build.sh || exit 0'
            }
        }
    }
}