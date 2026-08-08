pipeline {
    agent any

    stages {
        stage("Build") {
            steps {
                sh("echo Building service...")
            }
        }

        stage("Test") {
            steps {
                sh("echo Testing service...")
            }
        }

        stage("Docker Build") {
            steps {
                sh("echo Building docker image...")
            }
        }

        stage("Deploy") {
            steps {
                sh("echo Deploying to app...")
            }
    }
}