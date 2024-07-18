pipeline {
    agent any
    tools {
  dockerTool 'mydocker'
    }
        stages {
            stage("Checkout SCM") {
                steps {
                    script {
                    checkout scmGit(branches: [[name: '*/main1']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Srikanth094/jenkins']])
                    }
                }
            }
            stage("Build") {
                steps {
                    script {
                        def dockerImage = docker.build('anantharamu094/apache:latest','.');
                        }
                    }
            }
            stage("Push docker image to docker hub"){
                steps {
                    script {
                        docker.withRegistry('https://hub.docker.com','docker-hub') {
                        dockerImage.push()
                        }
                    }
                }
            }
        }
    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
