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
        sh 'yarn install'
      }
    }
    stage('Run-Test') {
      steps {
        sh 'yarn test --all --watchAll=false'
      }
    }
  }
}
