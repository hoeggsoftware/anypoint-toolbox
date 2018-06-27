pipeline {
    agent none
    triggers {
        pollSCM 'H/5 * * * *'
    }
    stages {
        stage('Build Docker Image') {
            agent any
            
            steps {
            	// build image
				sh "docker build -t anypoint-toolbox:latest ."	
            }
        }
	}
}