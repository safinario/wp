pipeline {
    agent any
    environment {
        sshUserPrivateKey = credentials('Home')
    }
    stages {
        stage ('DeploytoStage') {  
                steps {
                echo 'Deploying..'
                sh 'ssh static-simnet-185-130-52-137.stargrpns.pp.ua'
                sh 'pg_dump -c wp > wp_back && pg_dump -c wp > wp_trans && scp -i ~/Documents/aws.pem wp_back ubuntu@ec2-3-127-70-240.eu-central-1.compute.amazonaws.com:/home/ubuntu/'
                }
            }
        }
    }
