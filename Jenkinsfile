pipeline {
    agent any
        stages {
            stage ('DeploytoStage') {  
                steps {
                echo 'Deploying..'
                sshagent (credentials: ['Home']) {
                sh 'ssh -o StrictHostKeyChecking=no pg_dump -c wp > wp_back && pg_dump -c wp > wp_trans && scp -i ~/Documents/aws.pem wp_back ubuntu@ec2-3-127-70-240.eu-central-1.compute.amazonaws.com:/home/ubuntu/'
                }
            }
        }
    }
}
