pipeline {
  agent any
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