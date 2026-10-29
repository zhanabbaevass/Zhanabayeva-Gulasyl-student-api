pipeline {
    agent any

    environment {
        IMAGE_NAME = 'zhanabayeva-gulasyl-student-api'
        IMAGE_TAG  = 'v1.0-gulasyl-zhanabayeva'
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
                echo '=== STAGE: Build and test with Gradle ==='
                echo 'Student: Gulasyl Zhanabayeva'
                sh 'docker run --rm --volumes-from $(hostname) -w "$PWD" gradle:8.4-jdk17 gradle test bootJar --no-daemon'
            }
        }

        stage('Docker Build') {
            steps {
                echo '=== STAGE: Build Docker image ==='
                sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
            }
        }

        stage('Verify') {
            steps {
                echo '=== STAGE: Verify image ==='
                sh 'docker images | grep $IMAGE_NAME'
            }
        }
    }

    post {
        success {
            echo 'Pipeline succeeded! Student: Gulasyl Zhanabayeva'
        }
        failure {
            echo 'Pipeline failed! Please check the logs and fix the error.'
        }
    }
}
