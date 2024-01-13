pipeline {
  agent any
  environment {
    AWS-ACCESS-KEY-ID = credentials('AWS-ACCESS-KEY-ID')
    AWS-SECRET-ACCESS-KEY = credentials('AWS-SECRET-ACCESS-KEY')
    AWS_DEFAULT_REGION = "us-east-1"
  }
  stages {
    stage ('clean workspace') {
      steps {
        cleanWs()
      }
    }
    stage ('Checkout from Git') {
      steps {
        git branch: 'main', url: 'https://github.com/Gabinsime75/Deploying_an_EKS_Cluster_with_Terraform_and_Jenkins.git'
        echo 'Git checkout successful.'
      }
    }
    stage ('Initializing Terraform') {
      steps {
        script {
          dir('EKS') {
            sh 'terraform init'
            echo 'Terraform initialization successful.'
          }
        }
      }
    }
    stage ('Formating Terraform Code') {
      steps {
        script {
          dir('EKS') {
            sh 'terraform fmt'
          }
        }
      }
    }
    stage ('Validating Terraform Code') {
      steps {
        script {
          dir('EKS') {
            sh 'terraform validate'
          }
        }
      }
    }
    stage ('Previewing the Infra using Terraform') {
      steps {
        script {
          dir('EKS') {
            sh 'terraform plan'
          }
          input(message: "Do you want to proceed", ok: "Proceed")
        }
      }
    }
    stage ('Creating/Deleting the Cluster') {
      steps {
        script {
          dir('EKS') {
            def userInput = input(
              id: 'userInput',
              message: 'Select action:',
              parameters: [choice(name: 'Action', choices: 'Apply\nDestroy', description: 'Select action to perform')]
            )
            def action = userInput == 'Apply' ? 'apply' : 'destroy'
            sh "terraform $action --auto-approve"
          }
        }
      }
    }
  }
}
