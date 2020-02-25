
pipeline {
    agent none
    
   stages {
        stage('GIT PUll') { 
            agent {
                 label 'master'
                }
            steps {
                dir('application_code'){
                    git url: 'https://github.com/spring-projects/spring-petclinic'
                }
                
            }
        }
        stage('build') { 
            agent {
                 label 'master'
                }
            steps {
             echo "Build app"  
             dir('application_code'){
                 withMaven(maven: 'Maven 3.3.9') 
                {
                  sh 'mvn package'
                } 
             
                   
              }
            }
             post {
                success {
                    sh 'sudo mkdir -p /mnt/artefact'
                    // delete from mnt/artefact if any
                    sh 'sudo cp $WORKSPACE/application_code/target/*.jar  /mnt/artefact'

                } 
            }   
        }
        stage('Invoke ansible script') { 
            agent {
                 label 'master'
                }
            steps {
               echo "invoke the playbook"  
               sh 'ansible-playbook -i inventory ee-playbook.yaml -vvv'
               
             
            }
        }
        stage('Build image') { 
            agent { label 'worker' }
            steps {
               echo "Build the docker file"  
               script{
                
                 sh 'cp /mnt/artefact/*jar $WORKSPACE'
                 customImage = docker.build("chandrapurnimabhatnagar/angularapp:${BUILD_NUMBER}")
                
                }
            }
        }
        stage('Deploy Image') { 
            agent { label 'worker' } 
            steps {
               echo "Build the docker file"  
                script{
                  sh ' echo Hello'
                  docker.withRegistry( 'https://registry.hub.docker.com', 'DOCKERHUBLOGIN' ) {
                           customImage.push()
                     }
                }
            }  
        }
        stage('run conatiner') { 
            agent { label 'worker' } 
            steps {
               echo "Build the docker file"  
                script{
                  sh "docker run --name testcontainer-${BUILD_NUMBER} -d chandrapurnimabhatnagar/angularapp:${BUILD_NUMBER} "
                  sh 'docker ps -a'
                  sh "docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' testcontainer-${BUILD_NUMBER}"
                  sh "docker inspect testcontainer-${BUILD_NUMBER}"
                }
            }  
        }       
    }
 

    // post {  
          
    //     success {  
    //          echo 'This will run only if successful'  
    //          mail bcc: '', body: " Build Result : Success <br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> URL de build: ${env.BUILD_URL}", cc: '', charset: 'UTF-8',  mimeType: 'text/html', replyTo: '', subject: "Success CI: Project name -> ${env.JOB_NAME}", to: "cpb.95.2012@gmail.com";  
    //     }  
    //     failure {  
    //         echo " Sending mail with failure cause"
    //         mail bcc: '', body: "Build Result : Failure<br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> URL de build: ${env.BUILD_URL}", cc: '', charset: 'UTF-8', from: 'shobha.bhatnagar94@gmail.com', mimeType: 'text/html', replyTo: '', subject: "ERROR CI: Project name -> ${env.JOB_NAME}", to: "cpb.95.2012@gmail.com";  

    //     }  
    // }   
}

