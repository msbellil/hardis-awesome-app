pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Running build automation'
                sh 'npm install'
                sh 'ng build'
                sh 'zip -r dist/hardis-awesome-app.zip hardis-awesome-app'
                archiveArtifacts artifacts: 'dist/hardis-awesome-app.zip'
            }
        }
        stage('Deploiement Recette') {
            when {
                branch 'master'
            }
            steps {
              echo 'Running Deploiement Recette'
withCredentials([sshUserPrivateKey(credentialsId: 'webserver_login', keyFileVariable: 'identity', passphraseVariable: '', usernameVariable: 'ubuntu')]){
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
                                        execCommand: 'unzip /tmp/hardis-awesome-app.zip && node /tmp/hardis-awesome-app/app.js'
                                    )
                                ]
                            )
                        ]
                    )
                }
            }
        }
}
}
