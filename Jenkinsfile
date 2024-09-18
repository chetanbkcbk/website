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
    post {
        // Always send an email after the pipeline runs
        always {
            script {
                emailext(
                    subject: "Jenkins Build Notification - ${currentBuild.fullDisplayName}",
                    body: """
                        <h2>Build Notification</h2>
                        <p>Project: ${JOB_NAME}</p>
                        <p>Build Number: ${BUILD_NUMBER}</p>
                        <p>Status: ${currentBuild.currentResult}</p>
                        <p>View build: <a href="${BUILD_URL}">${BUILD_URL}</a></p>
                    """,
                    to: 'chetanbkcbk@gmail.com',
                    from: 'jenkins@gmail.com',
                    replyTo: 'jenkins@gmail.com',
                    mimeType: 'text/html' // Comma added before this line
                )
            }
        }
    }
}
