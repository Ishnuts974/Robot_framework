pipeline {
    agent any

    environment {
        ROBOT_FILE = 'tests\\checkout_test.robot'
        XRAY_URL = 'https://xray.cloud.getxray.app'
    }

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
                bat 'python --version'
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

        // stage('Get Xray Token') {
        //     steps {
        //         withCredentials([
        //             string(credentialsId: 'XRAY_CLIENT_ID', variable: 'CLIENT_ID'),
        //             string(credentialsId: 'XRAY_CLIENT_SECRET', variable: 'CLIENT_SECRET')
        //         ]) {
        //             bat """
        //             curl -X POST %XRAY_URL%/api/v2/authenticate ^
        //             -H "Content-Type: application/json" ^
        //             -d "{\\"client_id\\":\\"%CLIENT_ID%\\",\\"client_secret\\":\\"%CLIENT_SECRET%\\"}" ^
        //             -o token.txt
        //             """
        //         }
        //     }
        // }
        stage('Upload Results to Xray') {
            steps {
                withCredentials([
                    string(credentialsId: 'XRAY_CLIENT_ID', variable: 'CLIENT_ID'),
                    string(credentialsId: 'XRAY_CLIENT_SECRET', variable: 'CLIENT_SECRET')
])
                bat """
                curl -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZW5hbnQiOiJiNmNhZGQwNS1lMzQxLTNmMTctYjU1Zi00OTM0MTI4MWQ4MmEiLCJhY2NvdW50SWQiOiI3MTIwMjA6OWYwYzgwZGQtY2I4ZC00NTAwLTk4NzItYTQ5MmEzOWU3MTRkIiwiaXNYZWEiOmZhbHNlLCJpYXQiOjE3NzAyODI3OTQsImV4cCI6MTc3MDM2OTE5NCwiYXVkIjoiQzRCRTk4MUExNUMzNEU4OEI5NDVDMTY3RDNGNTA5MDYiLCJpc3MiOiJjb20ueHBhbmRpdC5wbHVnaW5zLnhyYXkiLCJzdWIiOiJDNEJFOTgxQTE1QzM0RTg4Qjk0NUMxNjdEM0Y1MDkwNiJ9.n572zOHkJQv_pth9fQrz8lVgcYPEm-ZsWOWUjRx8tZw" -F "file=@output.xml" ^%XRAY_URL%/api/v2/import/execution/robot?projectKey=POEI2-1072
                """
            }
        }

        stage('Archive Results') {
            steps {
                archiveArtifacts artifacts: '*.xml, *.html', fingerprint: true
            }
        }
    }
}


