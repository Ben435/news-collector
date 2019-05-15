pipeline {
    agent any

    triggers {
        cron('H 0 * * *') //regular builds, approx midnight.
        pollSCM('0 * * * *') //polling for changes, once per hour.
    }

    stages {
        stage('Checkout code') {
            steps {
                checkout changelog: true, poll: true, scm: [$class: 'GitSCM', browser: [$class: 'GithubWeb'], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'BenGitHub', url: 'ssh://git@github.com:Ben435/news-collector.git']]]
            }
        }

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