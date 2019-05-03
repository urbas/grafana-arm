releaseVersion = "6.1.6"

pipeline {
    agent any

    stages {
        stage('Build Status') {
            steps {
                githubStatus("pending", "Docker image build and push running...")
            }
        }
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

    post {
        success {
            githubStatus("success", "Docker image build and push succeeded")
        }
        failure {
            githubStatus("failure", "Docker image build and push failed")
        }
    }
}

def githubStatus(state, description) {
    withCredentials([string(credentialsId: "GitHubWebHookRepoMatejAccessToken", variable: "TOKEN")]) {
        sh """
            set +x
            curl -XPOST -fSsu urbas:\$TOKEN https://api.github.com/repos/urbas/grafana-arm/statuses/\$GIT_COMMIT --data '{"state":"$state","target_url":"${env.BUILD_URL}","description":"$description","context":"cd/jenkins/dockerhub"}' > /dev/null
        """
    }
}