pipeline {
    agent any

    tools {
        nodejs "node"
    }

    stages {
        stage("Build") {
            steps {
                echo "Building service..."
                sh "npm install"
            }
        }

        stage("Test") {
            steps {
                echo "Testing service..."
                sh "npm test"
            }
        }

        stage("Docker Build") {
            steps {
                echo "Building docker image..."
                sh "docker build -t nodemain:v1.0 ."
                sh "docker images | grep nodemain"
            }
        }

        stage("Deploy") {
            steps {
                echo "Deploying app..."
                sh "chmod +x ./prune_containers.sh"
                sh "./prune_containers.sh nodemain:v1.0"
                sh "docker run -d --expose=3000 -p 3000:3000 nodemain:v1.0"
                sh "docker ps | grep nodemain"
            }
        }
    }
}