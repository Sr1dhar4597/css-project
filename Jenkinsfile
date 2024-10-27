pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "my-css-website" // Local Docker image name
    }

    stages {
        stage('Checkout') {
            steps {
                // Check out code from source control
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image with the Jenkins build number
                    sh "docker build -t ${DOCKER_IMAGE}:${env.BUILD_NUMBER} ."
                }
            }
        }

        stage('Deploy Locally') {
            steps {
                script {
                    // Stop and remove the existing container if running, then deploy the new image
                    sh """
                    docker stop my-css-website || true
                    docker rm my-css-website || true
                    docker run -d -p 80:80 --name my-css-website ${DOCKER_IMAGE}:${env.BUILD_NUMBER}
                    """
                }
            }
        }
    }

    post {
        always {
            cleanWs() // Clean up workspace
        }
        success {
            echo 'Docker image built and deployed successfully!'
        }
        failure {
            echo 'Failed to build or deploy the Docker image.'
        }
    }
}
