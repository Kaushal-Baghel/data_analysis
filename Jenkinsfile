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
                           wrkspc= \$(echo \${env} | tr '/' '\n'| tail -1)
                           cp -R \$(echo \${wrkspc}"/Data_Analysis_Script/") .
                       
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
