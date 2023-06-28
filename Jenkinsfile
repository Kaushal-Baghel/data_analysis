pipeline {
    agent any

    stages {
        stage('BUILD') {
            steps {
                script{
                    sh("""#!/bin/bash
                           set -x
                           chmod +x -R "{env.WORKSPACE}"
                           env=\"${env.WORKSPACE}"
                           echo \${env}
                       
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
}
