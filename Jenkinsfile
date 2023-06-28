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
                           cp -R ./Data_Analysis_Script/ \${env}
                           #wrkspc= \$(echo \${env}| rev| cut -d'/' -f2-| rev)
                           #script_path=\$(echo \$(echo \${wrkspc})"/Data_Analysis_Script/")
                           #echo \${wrkspc}
                       
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
