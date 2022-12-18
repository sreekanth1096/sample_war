pipeline {
  agent any
  environment {
		DOCKERHUB_CREDENTIALS=credentials('docker_creds')
	}
  stages {
    stage('Checkout') {
      steps {
        git(url: 'https://github.com/sreekanth1096/sample_war.git', branch: 'main')
      }
    }

    stage('building image') {
      steps {
        sh '''docker build -t sample-tomcat .
docker tag sample-tomcat sreekanth1096/sample-tomcat:latest
echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
docker push sreekanth1096/sample-tomcat:latest'''
      }
    }

    stage('conclusion') {
      steps {
        echo 'End of the pipeline'
      }
    }

  }
}
