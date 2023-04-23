pipeline {
    agent any

    stages {
        stage('Install Deps') {
            steps {
                echo 'Install Deps'
                script{
                    if(isUnix()){
                        sh 'npm install'
                    }else{
                        bat 'npm install'
                    }
                }
            }
        }
        stage('Run tests') {
            steps {
                echo 'Run tests'
                script{
                    if(isUnix()){
                        sh 'npm test'
                    }else{
                        bat 'npm test'
                    }
                }
            }
        }
        stage('Generate Report') {
            steps {
                echo 'Generate Report'
                script{
                    if(isUnix()){
                        sh 'npm run report'
                    }else{
                        bat 'npm run report'
                    }
                }
            }
        }
        stage('Publish report') {
            steps {
                echo 'Publish Report'
                publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'report', reportFiles: 'cucumber_report.html', reportName: 'HTML Report', reportTitles: '', useWrapperFileDirectly: true])
            }
        }
        stage('Clone test automation') {
            steps {
                echo 'Cloning'
                checkout changelog: false, poll: false, scm: scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sridharbandi/cucumberjs-dt-example.git']])
            }
        }
        stage('Install Deps') {
            steps {
                echo 'Install Deps'
            }
        }

    }
}
