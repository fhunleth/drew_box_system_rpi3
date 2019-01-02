pipeline {
    agent any

    environment {
        GITHUB_TOKEN = '62886b1e475cf9d39c670a109e0ea29cceca9641'
        USERNAME = 'laibulle'
        REPO = 'excrement_system_rpi3'
    }

    stages {
        stage('Build') {
            steps {
                sh "whoami"
                sh "chmod +x build.sh"
                sh './build.sh'
            }
        }
    }
}