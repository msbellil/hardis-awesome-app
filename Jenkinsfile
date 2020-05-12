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
                 input 'Does the staging environment look OK?'
                milestone(1)
				   script {
                        sh "ssh -i ${env.user_rsa_key} ubuntu@${env.prod_ip} \"docker pull bllmhd/hardis-awesome-app:latest\""
                        try {
                            sh "ssh -i ${env.user_rsa_key} ubuntu@${env.prod_ip} \"docker stop hardis-awesome-app\""
                            sh "ssh -i ${env.user_rsa_key} ubuntu@${env.prod_ip} \"docker rm hardis-awesome-app\""
                        } catch (err) {
                            echo: 'caught error: $err'
                        }
                        sh "ssh -i ${env.user_rsa_key} ubuntu@${env.prod_ip} \"docker run --restart always --name hardis-awesome-app -p 8080:8080 -d bllmhd/hardis-awesome-app:latest\""
                    }
                }
            }
    }
}
