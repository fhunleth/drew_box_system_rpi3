pipeline {
    agent any

    environment {
        USERNAME = 'laibulle'
        REPO = 'drew_box_system_rpi3'
    }

    stages {
        stage('Build') {
            options { 
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