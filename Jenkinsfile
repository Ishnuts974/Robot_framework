pipeline {
    agent any

    tools {
        python 'Python3'
    }

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Run Robot Tests') {
            steps {
                sh 'robot --output output.xml --report report.html --log log.html tests/'
            }
        }

        stage('Archive Results') {
            steps {
                archiveArtifacts artifacts: '*.xml, *.html', fingerprint: true
            }
        }
    }

    post {
        always {
            publishHTML(target: [
                allowMissing: false,
                alwaysLinkToLastBuild: true,
                keepAll: true,
                reportDir: '.',
                reportFiles: 'report.html',
                reportName: 'Robot Report'
            ])
        }
    }
}

