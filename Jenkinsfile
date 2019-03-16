pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
    stage('Environment') {
      steps {
        sh 'git --version'
        echo "Branch: ${env.BRANCH_NAME}"
        sh 'docker -v'
        sh 'printenv'
      }
    }
    stage('Build') {
      steps {
        withDockerRegistry([ credentialsId: "docker-hub-timkipp", url: "" ]) {
          sh 'docker build -t jenkins-pipeline-test:${env.BRANCH_NAME} --no-cache .'
          sh 'docker tag jenkins-pipeline-test:${env.BRANCH_NAME} timkipp/jenkins-pipeline-test:${env.BRANCH_NAME}'
          sh 'docker push timkipp/jenkins-pipeline-test:${env.BRANCH_NAME}'
          sh 'docker rmi -f jenkins-pipeline-test:${env.BRANCH_NAME} timkipp/jenkins-pipeline-test:${env.BRANCH_NAME}'
        }
      }
    }
  }
}