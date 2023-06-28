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
                           wrkspc= \$(echo \${env::-1})
                           script_path=\$(echo \${wrkspc}"/Data_Analysis_Script/"
                           echo \${script_path}
                       
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
