pipeline {
  agent any
  environment {
    CI = 'true'
    SERVER_IP='$SERVER_IP'
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
      steps {
        sh 'echo "Copying packaged files to $SERVER_IP"'
        sh "scp -i .ssh/id_rsa -r \
            src public \
            package.json yarn.lock \
            docker-compose.yml Dockerfile .dockerignore \
            ec2-user@$SERVER_IP:mishipay"
      }
    }
  }
}
