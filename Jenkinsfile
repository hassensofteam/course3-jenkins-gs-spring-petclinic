pipeline {
    agent any

        /* deleteDir() */

        stages {
		/*
            stage('Checkout') {
                steps {
                  bat "git clone --branch main https://github.com/hassensofteam/course3-jenkins-gs-spring-petclinic"

                }
            }
		*/
            stage('Build') {
                steps {
                    dir('course3-jenkins-gs-spring-petclinic') {
                        bat "mvn package"
                    }
                }

            }
            
            stage('Packaging') {
                steps {
                    archiveArtifacts artifacts: '**/target/*.jar'
                }
            }
            
            stage('Test Coverage') {
                steps {
                    jacoco()
                }
            }
            
            stage('Unit Test Result') {
                steps {
                    junit '**/target/surefire-reports/TEST*.xml'
                }
            }
            
        }
        post { 
                always {
                    emailext body: "${env.BUILD_URL}\n${currentBuild.absoluteUrl}",
        	        to: 'always@foo.bar',
        	        recipientProviders: [previous()],
        	        subject: "${currentBuild.currentResult}: Job ${env.JOB_NAME} [${env.BUILD_NUMBER}]"
                    }
                
        }
        

    
}
       
