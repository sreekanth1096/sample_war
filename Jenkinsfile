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
        sh '''sudo docker build .
'''
      }
    }

    stage('conclusion') {
      steps {
        echo 'End of the pipeline'
      }
    }

  }
}
