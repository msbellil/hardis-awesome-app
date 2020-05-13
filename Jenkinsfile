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
                                       execCommand: 'docker pull bllmhd/hardis-awesome-app:latest && [ "$(docker ps -a | grep hardis-awesome-app)" ] && docker stop hardis-awesome-app && docker rm hardis-awesome-app' 
                                    )
                                              script {
                      
                        try {
                           docker pull bllmhd/hardis-awesome-app:latest 
                        } catch (err) {
                            echo: 'caught error: $err'
                        }
                      
                    }
                                ]
                   
                            )
                        ]
                    )
                }
            }
    }
}
