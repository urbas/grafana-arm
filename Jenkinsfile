releaseVersion = "6.1.6"

pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh "sudo docker build --build-arg GRAFANA_VERSION=${releaseVersion} -t urbas/grafana:${releaseVersion} ."
            }
        }
        stage('Deploy') {
            steps {
                sh "sudo docker push urbas/grafana:${releaseVersion}"
            }
        }
    }
}
