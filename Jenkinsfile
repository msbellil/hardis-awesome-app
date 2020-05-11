pipeline {
    agent any
    stages {
    stage('Build') {
            steps {
                echo 'Running build automation'
                sh 'npm install'
                sh 'ng build'
                sh 'zip -r dist/hardis-awesome-app.zip dist/hardis-awesome-app app.js'
                archiveArtifacts artifacts: 'dist/hardis-awesome-app.zip'
            }
        }
		
        stage('Build Docker Image') {
			echo 'Running build docker image'
            steps {
                script {
                    app = docker.build("bllmhd/hardis-awesome-app")
                    app.inside {
                        sh 'echo $(curl localhost:9999)'
                    }
                }
            }
        }
      
   
    }
}
