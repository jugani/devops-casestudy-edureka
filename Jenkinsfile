pipeline {
    agent master 
    stages {
        stage('GIT PUll') { 
            steps {
                dir(artifacts){
                    git url: 'https://github.com/edureka-git/DevOpsClassCodes.git'
                }
                
            }
        }
        stage('Test') { 
            steps {
             echo "Testing"  
             dir(artifacts){
                withMaven(maven: 'mymaven') {
                  sh 'mvn test'                 }
             } 
             
            }
        }
        stage('Deploy') { 
            steps {
                "
            }
        }
    }
}
