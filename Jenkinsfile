
pipeline {
    agent none
     tools {
        maven 'Maven 3.3.9'
    }
    
    stages {
        // stage('GIT PUll') { 
        //     agent {
        //          label 'master'
        //         }
        //     steps {
        //         dir('application_code'){
        //             git url: 'https://github.com/spring-projects/spring-petclinic'
        //         }
                
        //     }
        // }
        // stage('build') { 
        //     agent {
        //          label 'master'
        //         }
        //     steps {
        //      echo "Build app"  
        //      dir('application_code'){
        //           sh 'mvn package' 
        //       }
        //     }
        //      post {
        //         success {
        //             sh 'sudo mkdir -p /mnt/artefact'
        //             // delete from mnt/artefact if any
        //             sh 'sudo cp $WORKSPACE/application_code/target/*.jar  /mnt/artefact'

        //         } 
        //     }   
        // }
        // stage('Invoke ansible script') { 
        //     agent {
        //          label 'master'
        //         }
        //     steps {
        //        echo "invoke the playbook"  
        //        sh 'ansible-playbook -i inventory ee-playbook.yaml -vvv'
               
             
        //     }
        // }
        stage('Build docker Image') { 
            agent {
                 label 'worker'
                }
            steps {

                 sh 'pwd'
                 sh 'ls -lrt'
                 sh 'cp /mnt/artefact/*jar $WORKSPACE'
                 sh 'sudo docker build -t chandrapurnimabhatnagar/angularapp:v1 .'
                // sh 'sudo docker images'
                
               
             
            }
        }        
    }
    //     stage(' Compile & Package') { 
    //         steps {
    //          echo "Static code analysis"  
    //             dir('artifacts'){
    //                withMaven(maven: 'mymaven') {
    //                sh 'mvn compile' 
    //                 sh 'mvn package'  
               
    //               }  
             
    //             }
    //         } 
    //     }
    //     stage('Build image') { 
    //       //agent { label 'docker' }
    //     steps {
    //          echo "Build the docker file"  
    //          script{
                
    //              sh 'cp ${JENKINS_HOME}/workspace/${JOB_NAME}/artifacts/target/addressbook.war .'
    //              customImage = docker.build("chandrapurnimabhatnagar/addressbook:${BUILD_NUMBER}")
    //              echo customImage
                
    //          }
    //     }
    // }
    // stage('Deploy Image') { 
       
    //   steps {
    //          echo "Build the docker file"  
    //          script{
                 
    //              docker.withRegistry( '', 'DOCKERHUBLOGIN' ) {
    //                        customImage.push()
    //             }
    //          }
    //     }
    // }



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

