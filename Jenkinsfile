pipeline {
    agent any

    environment {
        IMAGE_NAME = 'zhanabayeva-gulasyl-student-api'
        IMAGE_TAG = 'v1.0-gulasyl-zhanabayeva'
    }

    stages {
        stage('Checkout') {
            steps {
                echo '=== STAGE: Checkout source code ==='
                checkout scm
            }
        }

        stage('Build & Test') {
            steps {
                echo '=== STAGE: Build Spring Boot Application via Gradle Docker ==='
                echo 'Student: Gulasyl Zhanabayeva'
                // Запускаем сборку внутри официального контейнера Gradle, не требуя gradle на самом Jenkins
                sh 'docker run --rm -v "$(pwd)":/app -w /app gradle:8.4-jdk17 gradle bootJar --no-daemon'
            }
        }

        stage('Docker Build') {
            steps {
                echo '=== STAGE: Build Docker Image ==='
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Verify') {
            steps {
                echo '=== STAGE: Verify Docker Image ==='
                sh "docker images | grep ${IMAGE_NAME}"
                echo 'Pipeline completed successfully for Gulasyl Zhanabayeva!'
            }
        }
    }

    post {
        failure {
            echo '❌ Pipeline failed! Please check the logs and fix the error.'
        }
    }
}
