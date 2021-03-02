pipeline {
    agent any
        stages {
            stage ('DeploytoStage') {  
                steps {
                echo 'Deploying..'
                sshagent (credentials: ['Home']) {
                sh 'PGPASSWORD=wppass pg_dump -c -U wp wp > wp_back && PGPASSWORD=wppass pg_dump -c -U wp wp > wp_trans && scp -i ~/Documents/aws.pem wp_back ubuntu@ec2-3-127-70-240.eu-central-1.compute.amazonaws.com:/home/ubuntu/'
                }
            }
        }
    }
}
