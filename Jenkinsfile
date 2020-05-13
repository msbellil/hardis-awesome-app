pipeline {
    agent any
    stages {		
      
       stage('Deploiement production') {
          steps {
                milestone(1)
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
