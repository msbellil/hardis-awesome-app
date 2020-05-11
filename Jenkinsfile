pipeline {
    agent any
    stages {		
        stage('Build Docker Image') {
            steps {
              echo 'Running build docker image'
                script {
                    app = docker.build("bllmhd/hardis-awesome-app")
                  echo 'Running app inside'
                    app.inside {
                        sh 'echo $(curl localhost:9999)'
                    }
                }
            }
        }
      
   
    }
}
