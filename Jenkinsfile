pipeline {
agent any
    environment {
        NEXUS_VERSION = "nexus3"
        NEXUS_PROTOCOL = "http"
        NEXUS_URL = "nexus:8081"
        NEXUS_REPOSITORY = "spring-petclinic"
        NEXUS_CREDENTIAL_ID = "nexus-credentials"
        
    }
    stages {
        stage ('Checkout') {
          steps {
            git 'https://github.com/RuanGalvao/PetClinic-SpringBoot-MySQL-'
          }
        }
        stage('Java Build') {
            steps {
                sh 'docker exec -dit -v .:/source  maven "mvn install -DskipTests"'
            }
        
        stage('Unity Tests') {
            steps {
                sh 'mvn test -Dskiptests'
            }
        }
        
        stage('QA') {
            steps {
                sh ' chmod +x mvnw '
                
                sh './mvnw sonar:sonar -Dsonar.projectKey=petclinic -Dsonar.host.url=http://host.docker.internal:9000 -Dsonar.login=503661e9f8e64d476a491eff45c6489c95637506'
            }
        stage('Docker Build') {
            steps {
                sh 'docker build -t dockerImage-test:1.0 .'
            }
        }
       

	}
        stage("Publish to nexus") {
            //when {
            //    branch 'master' 
            //}
            steps {
                sh 'docker push nexus:8081/spring-petclinic/repo/dockerImage-test:1.0"'

            }
        }
    }
}
    
