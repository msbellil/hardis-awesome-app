pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Running build automation'
                sh 'npm install'
                sh 'ng build'
                sh 'mkdir hardisawesomeapp.zip'
                archiveArtifacts artifacts: 'dist/hardisawesomeapp.zip'
            }
        }
        stage('DeployToRecette') {
            when {
                branch 'master'
            }
            steps {
withCredentials([sshUserPrivateKey(credentialsId: 'webserver_login', keyFileVariable: 'identity', passphraseVariable: '', usernameVariable: 'ubuntu')]){
                    sshPublisher(
                        failOnError: true,
                        continueOnError: false,
                        publishers: [
                            sshPublisherDesc(
                                configName: 'recette', 
                                transfers: [
                                    sshTransfer(
                                        sourceFiles: 'dist/hardisawsomeapp.zip',
                                        removePrefix: 'dist/',
                                        remoteDirectory: '/tmp',
                                        execCommand: 'node app.js'
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
