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
                                       
                                    )
                                ]
                            )
                        ]
                    )
                }
            }
    }
}
