pipeline {
  agent any

  triggers {
    pollSCM ('H/3 * * * *')
  }
  stages {
    stage('pre-requiste') {
      steps {
        sh '''
        terraform -version
        aws sts get-caller-identity
        '''
      }
    }
    stage('terraform init') {
      steps {
        sh "terraform init"
      }
    }
    stage('terraform validate') {
      steps {
        sh "terraform validate"
      }
    }
    stage('terraform plan') {
      steps {
        sh "terraform plan"
      }
    }
    stage('Approval') {
      steps {
        input message: 'Approve terraform apply?'
      }
    }
    stage('terraform apply') {
      steps {
        sh "terraform apply --auto-approve"
      }
    }
        stage('Cleanup Workspace') {
      steps {
        deleteDir()
      }
    }
  }
}