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
            stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker_hub_login') {
                        app.push("latest")
                    }
                }
            }
        }
	  
       stage('Deploiement production') {
          steps {
                    sshPublisher(
                        failOnError: true,
                        continueOnError: false,
                        publishers: [
                            sshPublisherDesc(
                                configName: 'production', 
                                transfers: [
                                    sshTransfer(
                                       execCommand: 'docker pull bllmhd/hardis-awesome-app:latest && [ "$(docker ps -a | grep hardis-awesome-app)" ] && docker stop hardis-awesome-app && docker rm hardis-awesome-app; docker run --restart always --name hardis-awesome-app -p 9999:9999 -d bllmhd/hardis-awesome-app:latest' 
                                    )
                                ]
                   
                            )
                        ]
                    )
             }
        }
    }
}
