pipeline{
    agent any
    
    stages{
        stage('clone'){
            steps{
                git 'https://github.com/chetanbkcbk/website.git'
            }
        }
        stage('build'){
            steps{
                sh 'docker build -t webapp .'
            }
        }
        stage('run'){
            steps{
                sh 'docker run -d -it --name webcontainer -p 80:80 webapp'
            }
        }
    }
}