pipeline {
    agent {
        label 'node-2610'
    }
    environment {
  BUCK_NAME = "cicd-pipeline-aws-ashwini-ajgekar"
}

    stages {
        stage('git clone') {
            steps {
                echo 'Hello World'
                git branch: 'main', url: 'https://github.com/ashwiniajgekar/Myprojects.git';
            }
        }
        stage('check buck or not ') {
            steps {
                echo 'Hello World'
                sh '''
                if aws s3 ls s3://${BUCK_NAME}; then
                    echo "bucket already exists"
                else
                    aws s3 mb s3://${BUCK_NAME}
                fi        
                    '''
            }
        }
        stage('deploy to both'){
            parallel{
                stage('deploy to s3') {
            steps {
                echo 'Hello World'
                sh 'aws s3 sync . s3://${BUCK_NAME}/'
               
            }
        }
        stage('deploy to ec2') {
            steps {
                echo 'Hello World'
                sh 'sudo rm -rf /var/www/html/*'
                sh 'sudo cp -r . /var/www/html'
               
            }
        }
            }
        }
    }
}
