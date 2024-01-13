pipeline {
  agent any
  environment {
    AWS_ACCESS_KEY_ID = credentials('AWS-ACCESS-KEY-ID')
    AWS_SECRET_ACCESS_KEY = credentials('AWS-SECRET-ACCESS-KEY')
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
        }
      }
    }
    stage ('Creating/Deleting the Cluster') {
      steps {
        script {
          dir('EKS') {
            sh "terraform $action --auto-approve"
          }
        }
      }
    }
    stage ('Deploying Nginx Application') {
      steps {
        script {
          dir('EKS/ConfigurationFiles') {
            sh 'aws eks update-kubeconfig --name my-eks-cluster'
            sh 'kubectl apply -f deployment.yaml'
            sh 'kubectl apply -f service.yaml'
          }
        }
      }
    }
  }
}
