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
                  sh 'mvn sonar:sonar -Dsonar.projectKey=devops-casestudy -Dsonar.host.url=http://35.200.254.182:9000 -Dsonar.login=571a21bbd37e72fe471a9dd4f5953b9a226b6744'                 }
             } 
             
            }
        }
    }
    post {  
          
         success {  
             echo 'This will run only if successful'  
             mail bcc: '', body: "Success <b>Example</b><br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> URL de build: ${env.BUILD_URL}", cc: '', charset: 'UTF-8', from: 'cpb.95.2012@gmail.com', mimeType: 'text/html', replyTo: '', subject: "ERROR CI: Project name -> ${env.JOB_NAME}", to: "cpb.95.2012@gmail.com";  
         }  
         failure {  
             mail bcc: '', body: "<b>Example</b><br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> URL de build: ${env.BUILD_URL}", cc: '', charset: 'UTF-8', from: 'cpb.95.2012@gmail.com', mimeType: 'text/html', replyTo: '', subject: "ERROR CI: Project name -> ${env.JOB_NAME}", to: "cpb.95.2012@gmail.com";  
         }  
     }   
}
