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
	  
   stage('DeployToProduction') {
            steps {
                input 'Deploy to Production?'
                milestone(1)
                kubernetesDeploy(
                    kubeconfigId: 'kubeconfig',
                    configs: 'kube.yml',
                    enableConfigSubstitution: true,
                  textCredentials: [certificateAuthorityData: '', clientCertificateData: '', clientKeyData: '', serverUrl: 'http://3.12.152.158']
                )
            }
        }
    }
}
