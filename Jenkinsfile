pipeline {
    agent {
        docker {
            image 'openjdk:11.0.3-jdk-stretch'
        }
    }

    triggers {
        cron('H 0 * * *') //regular builds, approx midnight.
        pollSCM('H * * * *') //polling for changes, once per hour.
    }

    options {
        timeout(time: 30, unit: 'MINUTES')
        buildDiscarder(logRotator(numToKeepStr: '3'))
    }

    stages {
        stage('Build') {
            steps {
                sh "./gradlew clean war"    // ends up in `target = "build/libs/*.war"`
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