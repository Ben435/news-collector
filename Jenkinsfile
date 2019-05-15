def gradleTask(String... tasks) {
    if (tasks.length == 0) {
        println("Need at least 1 gradle task to run!")
        return
    }
    sh "./gradlew " + String.join(" ", tasks)
}

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
                gradleTask("clean", "war")   // ends up in `target = "build/libs/*.war"`
            }
        }

        stage('Test') {
            steps {
                gradleTask("test")
            }
        }

        stage('Deploy') {
            steps {
                sh "echo Deploy step NOT IMPLEMENTED"
            }
        }
    }
}