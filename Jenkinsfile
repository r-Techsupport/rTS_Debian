pipeline {
    agent {
        label 'buildah-x64'
    }
    environment {
        GITHUB_TOKEN = credentials('github_token')
    }
    stages {
        stage('Cloning repo...') {
            steps {
                checkout scm
            }
        }
        stage('Container build') {
            steps {
                echo 'Building...'
                sh '''
                    sudo buildah bud -t build:latest .
                '''
            }
        }
        stage('ISO build') {
            steps {
                echo 'Executing container...'
                sh '''
                    sudo podman run --volume ./:/repo --privileged --name build --rm build:latest
                '''
            }
        }
        stage('Release upload') {
            steps {
                echo 'Uploading release...'
                sh '''
                    gh release upload testing rTS_RescueMedia.iso --clobber
                '''
            }
        }
    }
}
