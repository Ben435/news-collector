pipeline {
    agent any

    triggers {
        cron('H 0 * * *') //regular builds, approx midnight.
        pollSCM('0 * * * *') //polling for changes, once per hour.
    }

    stages {
        stage('Checkout code') {
            git url: 'https://github.com/Ben435/news-collector'
        }

        stage('Build') {
            steps {
                sh "./gradlew clean war"
                target = "build/libs/*.war"
            }
        }

        stage('Test') {
            steps {
                sh "./gradlew test"
            }
        }

        stage('Deploy') {
            steps {
                sh "echo Deploy step NOT IMPLEMENTED"
            }
        }
    }
}