# DevSecOps Pipeline Demo

This project demonstrates a practical and automated approach to securing cloud infrastructure and CI/CD pipelines using DevSecOps best practices. It includes auditing AWS cloud resources, securing CI/CD workflows, automating security checks, and enforcing security policies.

---

## Project Overview

The goal of this demo is to showcase how to integrate continuous security into development and deployment workflows by:

- Auditing and securing AWS cloud infrastructure
- Implementing secure CI/CD pipelines with automated security scans
- Automating detection of misconfigurations and secret leaks
- Enforcing cloud security policies via Infrastructure as Code

---

## Platform Chosen

**Amazon Web Services (AWS)**  
AWS is one of the most widely used cloud providers, offering a rich set of services that need to be secured to prevent data leaks and vulnerabilities.

---

## Tools Used

| Tool         | Purpose                                                                                  |
|--------------|------------------------------------------------------------------------------------------|
| **Prowler**  | Scans AWS environments for security misconfigurations and compliance with best practices |
| **Terraform**| Manages cloud infrastructure as code and defines security policies like AWS SCPs          |
| **GitHub Actions** | Automates CI/CD pipeline execution including security scans on every code change      |
| **Trivy**    | Scans container images and filesystems for vulnerabilities                               |
| **tfsec**    | Analyzes Terraform code to find security issues                                          |
| **detect-secrets** | Detects accidentally committed secrets like API keys and passwords                  |
| **Docker**   | Containerizes the application code for consistent deployment and vulnerability scanning   |

---

## Project Components

### 1. AWS Security Audit with Prowler

- Scans AWS resources for misconfigurations such as public S3 buckets, missing encryption, and overly permissive IAM roles.
- Helps identify and fix cloud security weaknesses.

### 2. Terraform Infrastructure & Policies

- Defines AWS resources like S3 buckets and IAM policies using Terraform.
- Implements AWS Service Control Policies (SCPs) to block insecure settings (e.g., public-read S3 ACL).
- Ensures organization-wide security enforcement.

### 3. Secure CI/CD Pipeline (GitHub Actions)

- Runs automated security checks on every code push or pull request.
- Installs and runs:
  - **Trivy** to scan container images and filesystem vulnerabilities.
  - **tfsec** to scan Terraform infrastructure code for security issues.
  - **detect-secrets** to scan the codebase for hardcoded secrets.

### 4. Containerization with Docker

- A simple Python application is containerized using Docker.
- The container image can be scanned by Trivy to find vulnerabilities.

### 5. Sample Insecure Code

- A Python script (`test.py`) contains a hardcoded API key to demonstrate secrets detection.

---

## How to Run

1. **Terraform Setup:**  
   - Apply Terraform scripts to provision AWS resources and enforce security policies.

2. **GitHub Actions Pipeline:**  
   - On every commit, the pipeline runs automated scans (Trivy, tfsec, detect-secrets).

3. **Prowler Scan:**  
   - Run Prowler manually or integrate into CI to audit your AWS environment regularly.

4. **Docker:**  
   - Build and run the Docker container to package your application and scan for vulnerabilities.

---

## Why This Matters

This project illustrates how DevSecOps practices can be used to integrate security throughout the software development lifecycle — from infrastructure provisioning to code deployment — ensuring a safer, more compliant cloud environment.


---

