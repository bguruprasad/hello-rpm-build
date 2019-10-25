pipeline {
  agent any
  stages {
    stage('Make Tar') {
      steps {
        sh 'make tar'
      }
    }
    stage('Build RPM') {
      steps {
        sh 'make rpm'
      }
    }
  }
}