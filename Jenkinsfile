pipeline {
    agent any 
    stages {
        stage('GIT PUll') { 
            steps {
                dir('artifacts'){
                    git url: 'https://github.com/edureka-git/DevOpsClassCodes.git'
                }
                
            }
        }
        stage('Test') { 
            steps {
             echo "Testing"  
             dir('artifacts'){
                withMaven(maven: 'mymaven') 
                {
                  sh 'mvn test'
                } 
             
              }
            }
             post {
                always {
                    junit '**/target/*-reports/TEST-*.xml'

                }
           }
       }

        stage('Build and Sonar cube Analysis') { 
            steps {
             echo "Static code analysis"  
             dir('artifacts'){
                withMaven(maven: 'mymaven') {
                  sh 'mvn sonar:sonar -Dsonar.projectKey=devops-casestudy -Dsonar.host.url=http://localhost:9000 -Dsonar.login=5775ec7be686142a64e11b41bae4d5a94ca827bb'                 }
             } 
             
            }
        }
    }
}
