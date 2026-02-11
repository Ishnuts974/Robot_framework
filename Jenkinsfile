pipeline {
    agent any

    environment {
        ROBOT_FILE = 'tests\\checkout_test.robot'
        XRAY_URL = 'https://xray.cloud.getxray.app'
    }

    stages {

        stage('Checkout Code') {
            steps {
                //bat 'checkout scm'
                echo 'Projet checkout completed.'
            }
        }

        stage('Install Dependencies') {
            steps {
                bat 'pip install -r requirements.txt'
            }
        }

        stage('Run Robot Tests') {
            steps {
                bat 'python -m robot --output output.xml %ROBOT_FILE%'
            }
        }

        stage('Get Xray Token') {
            steps {
                withCredentials([
                    string(credentialsId: 'XRAY_CLIENT_ID', variable: 'CLIENT_ID'),
                    string(credentialsId: 'XRAY_CLIENT_SECRET', variable: 'CLIENT_SECRET')
                ]) {
                    bat """
                    curl -X POST %XRAY_URL%/api/v2/authenticate ^
                    -H "Content-Type: application/json" ^
                    -d "{\\"client_id\\":\\"%CLIENT_ID%\\",\\"client_secret\\":\\"%CLIENT_SECRET%\\"}" ^
                    -o token.txt
                    """
                }
            }
        }
        stage('Upload Results to Xray') {
            steps {
                withCredentials([
                    string(credentialsId: 'XRAY_CLIENT_ID', variable: 'CLIENT_ID'),
                    string(credentialsId: 'XRAY_CLIENT_SECRET', variable: 'CLIENT_SECRET')
                ])              
                {
                bat """
                    set /p TOKEN=<token.txt
                    curl -H "Authorization: Bearer %TOKEN%" ^
                    -F "file=@results\\output.xml" ^
                    "%XRAY_URL%/api/v1/import/execution/robot?projectKey=POEI2&testPlanKey=POEI2-1072"
		"""
		bat """
		    dir results 
		    type results\\output.xml

                """
                }
            }

        }
        stage('Archive Results') {
            steps {
                archiveArtifacts artifacts: '*.xml, *.html', fingerprint: true
            }
        }
    }
}


