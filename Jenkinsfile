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
            when {
                branch 'master'
            }
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
                                        execCommand: 'rm -rf * && unzip /tmp/hardis-awesome-app.zip && npm i --save express && sudo systemctl restart myapp'
                                    )
                                ]
                            )
                        ]
                    )
                }
            }
      
        stage('Deploiement production') {
            when {
                branch 'master'
            }
          steps {
                 input 'Does the staging environment look OK?'
                milestone(1)
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
                                        execCommand: 'rm -rf * && unzip /tmp/hardis-awesome-app.zip && npm i --save express && sudo systemctl restart myapp'
                                    )
                                ]
                            )
                        ]
                    )
                }
            }
        }
}
