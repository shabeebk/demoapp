pipeline {
  agent any
  environment {
    CI = 'true'
  }
  stages {
    stage('Build-Test') {
      agent {
        docker { image 'node:12.13.0-alpine' }
      }
      steps {
        sh 'echo "listing all available files"'
        sh 'ls'
        sh 'yarn install'
        sh 'yarn test --all --watchAll=false'
      }
    }
  }
}
