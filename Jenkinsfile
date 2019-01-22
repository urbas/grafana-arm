releaseVersion = "5.4.0"

pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh "sudo docker build -t urbas/grafana:${releaseVersion} ."
                sh "sudo docker tag urbas/grafana:${releaseVersion} latest"
            }
        }
        stage('Deploy') {
            steps {
                sh "sudo docker push urbas/grafana:${releaseVersion}"
                sh "sudo docker push latest"
            }
        }
    }
}