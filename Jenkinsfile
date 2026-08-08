pipeline {
    agent any

    tools {
        nodejs "node"
    }

    stages {
        stage("Build") {
            steps {
                sh("echo Building service...")
                sh("npm install")
            }
        }

        stage("Test") {
            steps {
                sh("echo Testing service...")
                sh("npm test")
            }
        }

        stage("Docker Build") {
            steps {
                sh("echo Building docker image...")
                sh("docker build -t nodedev:v1.0 .")
                sh("docker images | grep nodedev")
            }
        }

        stage("Deploy") {
            steps {
                sh("echo Deploying to app...")
                sh("docker rm -f \$(docker ps -aq --filter ancestor=nodedev:v1.0)")
                sh("docker run -d --expose=3000 -p 3001:3000 nodedev:v1.0")
                sh("docker ps | grep nodedev")
            }
        }
    }
}