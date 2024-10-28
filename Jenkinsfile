pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "my-css-website"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat "docker build -t ${DOCKER_IMAGE}:${env.BUILD_NUMBER} ."
                }
            }
        }

        stage('Deploy Locally') {
            steps {
                script {
                    bat """
                    docker stop my-css-website || exit 0
                    docker rm my-css-website || exit 0
                    docker run -d -p 81:81 --name my-css-website ${DOCKER_IMAGE}:${env.BUILD_NUMBER}
                    """
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
        success {
            echo 'Docker image built and deployed successfully!'
        }
        failure {
            echo 'Failed to build or deploy the Docker image.'
        }
    }
}
