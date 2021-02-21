pipeline {
	agent any
	environment {
		CI = 'true'
	}
	stages {
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
