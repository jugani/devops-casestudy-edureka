pipeline {
    agent any 
    stages {
        stage('GIT PUll') { 
            steps {
                dir(artifacts){
                    git url: 'https://github.com/edureka-git/DevOpsClassCodes.git'
                }
                
            }
        }
        stage('Build and Sonar cube Analysis') { 
            steps {
             echo "Testing"  
             dir(artifacts){
                withMaven(maven: 'mymaven') {
                  sh 'mvn sonar:sonar -Dsonar.projectKey=devops-casestudy -Dsonar.host.url=http://35.200.254.182:9000 -Dsonar.login=571a21bbd37e72fe471a9dd4f5953b9a226b6744'                 }
             } 
             
            }
        }


        stage('Test') { 
            steps {
             echo "Testing"  
             dir(artifacts){
                withMaven(maven: 'mymaven') 
                {
                  //sh 'mvn test'                 }
                } 
             
              }
            }
        }
        stage('Package') { 
            steps {
                echo " Deploy stage"
                // dir(artifacts){
                //withMaven(maven: 'mymaven') {
                 // sh 'mvn package'                 }
             //} 
            }
        }

        stage('Deploy') { 
           // agent Docker
            steps {
                echo " Deploy stage"
                 dir(artifacts){
                //withMaven(maven: 'mymaven') {
                  //sh 'mvn package'                 }
             //} 
            }
        }
    }
}
}
