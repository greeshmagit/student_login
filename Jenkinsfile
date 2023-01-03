
pipeline{
   agent any
      stages{
       	stage("docker build"){
      	    steps{
              		 sh "docker build -t pgreeshma/login-html:v1 ."
          	 }
       }
      stage("docker push to deckerhub repo"){
      steps{
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'pwd', usernameVariable: 'user')]) {
                    sh "docker login -u ${user} -p ${pwd}"
                    sh "docker push pgreeshma/login-html:v1"
                   }
            }
    }
    stage("docker deploy to nginx"){
      steps{
            sshagent(['Docker_creds']){
                                          sh "ssh -o StrictHostkeyChecking=no ec2-user@172.31.34.138 docker rm -f nginx"
                                          sh "ssh -o StrictHostkeyChecking=no ec2-user@172.31.34.138 docker rmi -f $(docker images -q -f dangling=true)"
                                          sh "ssh -o StrictHostkeyChecking=no ec2-user@172.31.34.138 docker run -d -p 80:80 --name nginx pgreeshma/login-html:v1"
             }
        }  
    }
  }
}
