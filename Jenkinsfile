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
    stage('Artifact-Push') {
      agent none
      steps {
        sh 'pwd'
        sh 'echo "Copying packaged files to 3.238.7.30"'
        sh "scp -i .ssh/id_rsa -r \
            src public \
            package.json yarn.lock \
            docker-compose.yml Dockerfile .dockerignore \
            ec2-user@3.238.7.30:mishipay"
      }
    }
  }
}
