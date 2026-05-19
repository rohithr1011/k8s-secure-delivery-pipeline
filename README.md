# DevSecOps Microservices Deployment Platform on AWS

## Overview

This project demonstrates a complete end-to-end DevSecOps pipeline for deploying microservices on AWS using:

* GitHub
* Jenkins
* SonarQube
* Trivy
* Docker
* Amazon ECR
* Amazon EKS
* Terraform
* Kubernetes

The goal of this project is to automate:

* Infrastructure provisioning
* CI/CD pipelines
* Security scanning
* Code quality checks
* Docker image creation
* Kubernetes deployments

---

# Architecture

```text
Developer Pushes Code → GitHub

        ↓ Webhook

Jenkins Pipeline Triggered

        ↓

1. Checkout Code
2. Install Dependencies
3. Run Unit Tests
4. SonarQube Scan
5. Quality Gate Validation
6. Docker Build
7. Trivy Filesystem Scan
8. Trivy Image Scan
9. Push Image to Amazon ECR
10. Deploy to Amazon EKS
11. Verify Kubernetes Deployment
```

---

# Tech Stack

| Tool       | Purpose                 |
| ---------- | ----------------------- |
| GitHub     | Source Code Management  |
| Jenkins    | CI/CD Automation        |
| SonarQube  | Code Quality Analysis   |
| Trivy      | Security Scanning       |
| Docker     | Containerization        |
| Amazon ECR | Docker Registry         |
| Amazon EKS | Kubernetes Cluster      |
| Terraform  | Infrastructure as Code  |
| Kubernetes | Container Orchestration |

---

# Project Structure

```text
.
├── app/
│   ├── Dockerfile
│   ├── index.js
│   ├── package.json
│
├── terraform/
│   ├── vpc/
│   ├── eks/
│   ├── jenkins/
│   ├── ecr/
│   └── environments/
│
├── k8s/
│   ├── deployment.yaml
│   ├── service.yaml
│   └── ingress.yaml
│
├── Jenkinsfile
│
└── README.md
```

---

# Infrastructure Components

## AWS VPC

Terraform provisions:

* VPC
* Public Subnets
* Private Subnets
* Internet Gateway
* NAT Gateway
* Route Tables

---

## Amazon EKS

Terraform provisions:

* EKS Cluster
* Managed Node Groups
* IAM Roles
* Security Groups

---

## Jenkins Server

Jenkins runs on an EC2 instance and performs:

* CI/CD automation
* Docker image builds
* Kubernetes deployments
* Security scanning

---

## SonarQube

Used for:

* Static code analysis
* Vulnerability detection
* Code smells
* Quality gate validation

---

## Trivy

Used for:

* Filesystem scanning
* Docker image vulnerability scanning
* Dependency vulnerability checks

---

# Prerequisites

Install the following tools:

* Git
* Docker
* Terraform
* AWS CLI
* kubectl
* eksctl
* Trivy

---

# AWS Services Used

* Amazon EC2
* Amazon VPC
* Amazon EKS
* Amazon ECR
* IAM
* CloudWatch

---

# Setup Instructions

## 1. Clone Repository

```bash
git clone <repository-url>
cd devsecops-project
```

---

## 2. Configure AWS CLI

```bash
aws configure
```

Add:

* AWS Access Key
* AWS Secret Key
* Region

---

# Terraform Deployment

## Step 1 — Deploy VPC

```bash
cd terraform/vpc

terraform init
terraform plan
terraform apply
```

---

## Step 2 — Deploy EKS Cluster

```bash
cd terraform/eks

terraform init
terraform plan
terraform apply
```

---

## Step 3 — Configure kubectl

```bash
aws eks update-kubeconfig \
--region ap-south-1 \
--name devsecops-eks
```

Verify:

```bash
kubectl get nodes
```

---

# Jenkins Setup

## Install Jenkins

```bash
sudo apt update
sudo apt install openjdk-17-jdk -y
sudo apt install jenkins -y
```

---

## Start Jenkins

```bash
sudo systemctl enable jenkins
sudo systemctl start jenkins
```

---

## Access Jenkins

```text
http://<PUBLIC_IP>:8080
```

---

# Docker Setup

Install Docker:

```bash
sudo apt install docker.io -y
```

Allow Jenkins access:

```bash
sudo usermod -aG docker jenkins
sudo usermod -aG docker ubuntu
```

---

# SonarQube Setup

Run SonarQube using Docker:

```bash
docker run -d \
--name sonarqube \
-p 9000:9000 \
sonarqube:lts
```

Access:

```text
http://<PUBLIC_IP>:9000
```

---

# Trivy Setup

Install Trivy:

```bash
sudo apt install trivy -y
```

Verify:

```bash
trivy --version
```

---

# Kubernetes Deployment

Deploy application:

```bash
kubectl apply -f k8s/
```

Verify:

```bash
kubectl get pods
kubectl get svc
```

---

# Jenkins Pipeline Stages

The Jenkins pipeline performs:

1. Source Code Checkout
2. Dependency Installation
3. Unit Testing
4. SonarQube Analysis
5. Docker Build
6. Trivy Security Scan
7. Push Image to ECR
8. Deploy to Kubernetes

---

# Security Scanning

## Trivy Filesystem Scan

```bash
trivy fs .
```

---

## Trivy Docker Image Scan

```bash
trivy image <image-name>
```

---

# Future Improvements

Planned enhancements:

* ArgoCD GitOps
* Helm Charts
* Prometheus Monitoring
* Grafana Dashboards
* Blue/Green Deployments
* Canary Deployments
* Kubernetes Autoscaling
* AWS Secrets Manager
* Terraform Remote Backend

---

# Learning Outcomes

This project demonstrates:

* DevOps Automation
* Infrastructure as Code
* Kubernetes Administration
* CI/CD Pipelines
* DevSecOps Practices
* Docker Containerization
* AWS Cloud Deployment
* Security Scanning
* Production Architecture Design

---

# Author

Rohith R
DevOps Engineer

---

# License

This project is for learning and educational purposes.
