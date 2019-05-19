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
            args '-v $HOME/.m2:/root/.m2'
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
                // ends up in `target = "build/libs/*.war"`
                gradleTask("clean", "bootWar")
            }
        }

        stage('Test') {
            steps {
                gradleTask("test")
            }
        }

        stage('Deploy') {

            steps {
                script {
                    docker.withRegistry('http://127.0.0.1:5000/v2/') {
                        docker.build("news-${GIT_BRANCH}-${BUILD_ID}").push('latest')
                    }
                }
            }
        }
    }
}