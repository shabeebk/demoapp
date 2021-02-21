pipeline {
	agent any
	environment {
		CI = 'true'
	}
	stages {
		agent {
			docker { image 'node:12.13.0-alpine' }
		}
		stage('Build-Test') {
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
