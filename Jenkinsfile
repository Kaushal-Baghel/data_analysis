pipeline {
    agent any

    stages {
        stage('BUILD') {
            steps {
                script{
                    sh("""#!/bin/bash
                           set -x
                           chmod +x -R "${env.WORKSPACE}"
                           env=\"${env.WORKSPACE}"
                           echo \${env}
                           cd ..
                           ls -l
                           cp -R ./Data_Analysis_Script/ \${env}
                           cd /Data_Analysis_Script/
                           sudo docker image build . -t data_analysis_app
                           sudo docker run -d -it --name Testcontainer --volume $PWD:/usr/app/src data_analysis_app
                           sudo docker ps
                       
                       """)
                }
            }
        }

        stage('DEPLOY') {
            steps {
                echo "DEPLOY"    
            }
        
        }
    }
    post{
        always{
        //    cleanWs()
            echo "Exit"
        }
    }
}
