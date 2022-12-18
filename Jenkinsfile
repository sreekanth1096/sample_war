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

    stage('build') {
      steps {
        sh '''docker build -t sample-tomcat .
docker tag sample-tomcat sreekanth1096/sample-tomcat:latest
echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
docker push sreekanth1096/sample-tomcat:latest'''
      }
    }
    
    stage('deploy') {
      steps {
        sh '''docker run --name sample-tomcat-container -d -p 8083:8080 sreekanth1096/sample-tomcat'''
      }
    }

    stage('conclusion') {
      steps {
        echo 'We built a image out of a sample war file and deployed it on a tomcat container which runs on port 8083 \n you can access the app using the url http://$(curl ifconfig.me):8083/sample'
      }
    }

  }
}
