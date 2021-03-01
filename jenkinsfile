pipeline {
    agent any

    stages {
        stage('DeploytoStage') {
            when {
                branch 'master'
            }        
            steps {
                sshagent (credentials : [Home]){
                echo 'Deploying..'
                sh 'ssh home pg_dump -c wp > wp_back && pg_dump -c wp > wp_trans && scp -i ~/Documents/aws.pem wp_back ubuntu@ec2-3-127-70-240.eu-central-1.compute.amazonaws.com:/home/ubuntu/'
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
