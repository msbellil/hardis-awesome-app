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
        stage('Deploiement Recette') {
            steps {
              echo 'Running Deploiement Recette'

                    sshPublisher(
                        failOnError: true,
                        continueOnError: false,
                        publishers: [
                            sshPublisherDesc(
                                configName: 'recette', 
                                transfers: [
                                    sshTransfer(
                                        sourceFiles: 'dist/hardis-awesome-app.zip',
                                        removePrefix: 'dist/',
                                        remoteDirectory: '/tmp',
                                        execCommand: 'rm -rf * && unzip /tmp/hardis-awesome-app.zip && npm i --save express && sudo systemctl restart hardisawesomeapp'
                                    )
                                ]
                            )
                        ]
                    )
                }
            }
      
        stage('Deploiement production') {
          steps {
                 input 'Does the staging environment look OK?'
                milestone(1)
                    sshPublisher(
                        failOnError: true,
                        continueOnError: false,
                        publishers: [
                            sshPublisherDesc(
                                configName: 'production', 
                                transfers: [
                                    sshTransfer(
                                        sourceFiles: 'dist/hardis-awesome-app.zip',
                                        removePrefix: 'dist/',
                                        remoteDirectory: '/tmp',
                                        execCommand: 'rm -rf * && unzip /tmp/hardis-awesome-app.zip && npm i --save express && sudo systemctl restart hardisawesomeapp'
                                    )
                                ]
                            )
                        ]
                    )
                }
            }
        }
}
