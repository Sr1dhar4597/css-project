pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the Git repository
                git 'https://github.com/Sr1dhar4597/css-project.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    echo 'Building Docker image...'
                    // Ensure the correct directory is set before building
                    dir('path/to/your/dockerfile') { // Change this to the path where your Dockerfile is located
                        // Build the Docker image
                        def image = docker.build("my-css-website:latest")
                    }
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    // Remove any existing container with the same name
                    sh 'docker rm -f my-css-website || true'

                    // Run the Docker container in detached mode
                    echo 'Running Docker container...'
                    sh 'docker run -d -p 8080:80 --name my-css-website my-css-website:latest'
                }
            }
        }
        stage('Verify') {
            steps {
                // Check if the container is running and log the status
                sh 'docker ps'
                sh 'docker logs my-css-website'
            }
        }
    }
    post {
        always {
            // Ensure that the always block has a step, such as logging a message
            echo 'Pipeline finished. The Docker container should be running on port 8080.'
        }
    }
}


