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
                           
                       """)
                }
            }
        }

        stage('DEPLOY') {
            steps {
                script {
                    echo "DEPLOY"
                    sh("""#!/bin/bash
                       echo "${env.WORKSPACE}"
                       git config --global user.email "kaushalbaghel96@gmail.com"
                       git config --global user.name "Kaushal-Baghel"
                       git config --list
                       git add .
                       git commit -m "Report Generated Successfully"
                       git push origin main
                       """)    
                }    
            }
        
        }
    }
    post{
        always{
            cleanWs()
            echo "Exit"
        }
    }
}
