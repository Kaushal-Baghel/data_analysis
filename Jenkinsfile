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
                           cd Data_Analysis_Script/
                           docker image build . -t data_analysis_app
                           docker run -d -it --name Testcontainer --volume $PWD/Data_Analysis_Script:/usr/app/src --entrypoint /bin/bash data_analysis_app
                           docker exec -it Testcontainer ls
                           docker exec -it Testcontainer python ./gen_report.py
                           docker ps
                       
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
