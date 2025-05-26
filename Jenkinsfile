pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "M3"
    }

    stages {
        stage('Build') {
            steps {
                // Get some code from a GitHub repository
                git branch: 'main', url: 'https://github.com/Rohit-Kumar4444/spring-boot-hello'

                // Run Maven on a Unix agent.
                sh "mvn -Dmaven.test.failure.ignore=true clean package"

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }
        }
           stage('build and create') {
               steps {
                           withCredentials([usernamePassword(credentialsId: '4', passwordVariable: 'passva', usernameVariable: 'userna')]) {
                        sh """
                        docker build -t rohit44docker/sprit .
                        echo "$passva" | docker login -u $userna --password-stdin
                        docker push rohit44docker/sprit
                        """
}
               }
        }
        stage('kubernetes deploy') {
               steps {
                           withCredentials([file(credentialsId: '6', variable: 'kuber')]) {
    // some block
    sh """
    export KUBECONFIG=$kuber
    kubectl apply -f depl.yaml
    kubectl apply -f svc.yaml
    """
}
               }
        }
    }
}
