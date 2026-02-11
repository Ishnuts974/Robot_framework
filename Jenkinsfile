pipeline {
    agent any

    tools {
        python 'Python3'
    }

    environment {
        ROBOT_FILE = 'tests\\checkout_test.robot'
    }

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                bat 'pip install -r requirements.txt'
            }
        }

        stage('Run Checkout Test') {
            steps {
                bat """
                robot ^
                --output output.xml ^
                --report report.html ^
                --log log.html ^
                %ROBOT_FILE%
                """
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
                reportName: 'Robot Checkout Report'
            ])
        }
    }
}
