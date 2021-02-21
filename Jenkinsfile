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
        sh 'echo "Copying packaged files to 3.238.7.30"'
        sh 'scp -i /.ssh/id_rsa -r \
            src public conf \
            package.json yarn.lock \
            docker-compose.yml Dockerfile .dockerignore \
            ec2-user@3.238.7.30:mishipay'
      }
    }
    stage('Deploy-App') {
      agent none
      steps {
        sh 'echo "Recreating and deploying the image"'
        sh 'ssh -i /.ssh/id_rsa ec2-user@3.238.7.30 "cd mishipay && docker-compose up --force-recreate --build -d"'
      }
    }
  }
}
