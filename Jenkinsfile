pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Running build automation'
                sh 'npm install'
                sh 'ng build'
                archiveArtifacts artifacts: 'dist/'
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
                                        sourceFiles: 'dist/hardis-awesome-app/',
                                        removePrefix: 'dist/',
                                        remoteDirectory: '/tmp',
                                        execCommand: 'node hardis-awesome-app/app.js'
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
