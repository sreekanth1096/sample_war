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
    stage('copy artifact') {
      steps {
        copyArtifacts filter: 'com.example.maven-project/webapp/1.0-SNAPSHOT/webapp-1.0-SNAPSHOT.war', fingerprintArtifacts: true, projectName: 'building the app', selector: lastSuccessful()
	      sh '''mv com.example.maven-project/webapp/1.0-SNAPSHOT/webapp-1.0-SNAPSHOT.war webapp.war
	      ls -lrt
	      '''
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
	sh'''
	set +x
	echo "We built a image out of a sample war file and deployed it on a tomcat container which runs on port 8083 \n you can access the app using the url http://$(curl ifconfig.me):8083/sample"
	'''
      }
    }

  }
}
