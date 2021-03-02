pipeline {
    agent any
        stages {
            stage ('DeploytoStage') {  
                steps {
                echo 'Deploying..'
                sshagent (credentials: ['Home']) {
                sh 'PGPASSWORD=wppass pg_dump -c -U wp -h localhost wp > wp_back'
                sh 'PGPASSWORD=wppass pg_dump -c -U wp -h localhost wp > wp_trans'
                sh 'scp -i ~/Documents/aws.pem wp_back ubuntu@ec2-3-127-70-240.eu-central-1.compute.amazonaws.com:/home/ubuntu/'
                }
            }
        }
    }
}
