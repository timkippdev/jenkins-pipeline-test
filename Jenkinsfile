node {
  try {
    stage('Checkout') {
      checkout scm
    }
    stage('Environment') {
      steps {

      }
      sh 'git --version'
      echo "Branch: ${env.BRANCH_NAME}"
      sh 'docker -v'
      sh 'printenv'
    }
    stage('Build') {
      steps {
        withDockerRegistry([ credentialsId: "docker-hub-timkipp", url: "" ]) {
          sh 'docker build -t jenkins-pipeline-test --no-cache .'
          sh 'docker tag jenkins-pipeline-test timkipp/jenkins-pipeline-test'
          sh 'docker push timkipp/jenkins-pipeline-test'
          sh 'docker rmi -f jenkins-pipeline-test timkipp/jenkins-pipeline-test'
        }
      }
    }
  } catch (e) {
      throw e
  }
}