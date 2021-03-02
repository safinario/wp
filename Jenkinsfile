pipeline {
    agent any
        stages {
            stage ('DeploytoStage') {  
                steps {
                echo 'Deploying..'
                node {
                    withCredentials([sshUserPrivateKey(credentialsId: 'Home')]) 
            stage('Remote SSH') {
                        sshCommand remote: remote, command: "cd /home/safinario"
                        sshCommand remote: remote, command: "pg_dump -c wp > wp_back && pg_dump -c wp > wp_trans && scp -i ~/Documents/aws.pem wp_back ubuntu@ec2-3-127-70-240.eu-central-1.compute.amazonaws.com:/home/ubuntu/"
                        }
                    }
                }
            }
        }
    }
