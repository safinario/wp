pipeline {
    agent any
        stages {
            stage ('DeploytoStage') {  
                steps {
                echo 'Deploying..'
                sshagent (credentials: ['Deploy']) {
                sh 'PGPASSWORD=wppass pg_dump -c -U wp -h localhost wp > wp_back'
                sh 'PGPASSWORD=wppass pg_dump -c -U wp -h localhost wp>wp_trans'
                sh 'scp safinario@static-simnet-185-130-52-137.stargrpns.pp.ua:/home/safinario/wp_back ubuntu@ec2-3-127-70-240.eu-central-1.compute.amazonaws.com:/home/ubuntu/'
                }
            }
        }
    }
}
