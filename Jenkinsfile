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
       
}
