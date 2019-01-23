releaseVersion = "5.4.3"

pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh "sudo docker build --build-arg GRAFANA_VERSION=${releaseVersion} -t urbas/grafana:${releaseVersion} ."
                sh "sudo docker tag urbas/grafana:${releaseVersion} urbas/grafana:latest"
            }
        }
        stage('Deploy') {
            steps {
                sh "sudo docker push urbas/grafana:${releaseVersion}"
                sh "sudo docker push urbas/grafana:latest"
            }
        }
    }
}