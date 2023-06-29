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
                           #cp -R ./Data_Analysis_Script/ \${env}
                           cd Data_Analysis_Script/
                           docker image build . -t data_analysis_app
                           docker run -d -t --name Testcontainer --volume /var/lib/jenkins/workspace/Data_Analysis_Script:/usr/app/src --entrypoint /bin/bash data_analysis_app
                           docker exec -t Testcontainer ls
                           docker exec -t Testcontainer python gen_report.py
                           docker ps
                           docker stop Testcontainer
                           docker rm Testcontainer
                           docker rmi data_analysis_app
                           cp -f /var/lib/jenkins/workspace/Data_Analysis_Script/index.html \${env}
                           git commit -m "${BUILD_NUMBER}"
                           git push
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
            //cleanWs()
            echo "Exit"
        }
    }
}
