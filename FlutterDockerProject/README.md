#  Flutter Docker Environment

A Dockerized Flutter development environment built using Ubuntu 22.04. This project provides a reproducible and isolated setup for Flutter development without requiring Flutter to be installed directly on the host machine.

## Overview

This project creates a Docker image containing:

* Ubuntu 22.04 base image
  
* Flutter SDK 3.24.0
  
* Git
  
* Curl
  
* Required Linux dependencies
  
* Flutter CLI tools

The container can be used to verify Flutter installation, run Flutter commands, and serve as a foundation for Flutter development workflows.

---

##  Features

* Containerized Flutter environment
  
* Consistent development setup across systems
  
* Flutter SDK installation via Docker
  
* Preconfigured development dependencies
  
* Easy environment recreation
  
* No local Flutter installation required

---

##  Technologies Used

* Docker
  
* Ubuntu 22.04
  
* Flutter 3.24.0
  
* Git
  
* Linux Development Tools

---

## Project Structure

```text
flutter-docker/
│
├── Dockerfile
└── README.md
```

---

##  Dockerfile Overview

The Dockerfile performs the following steps:

- Uses Ubuntu 22.04 as the base image.
   
- Installs required system dependencies.
   
- Clones the Flutter SDK from GitHub.
   
- Checks out Flutter version 3.24.0.
   
- Configures Flutter in the system PATH.
    
- Runs Flutter Doctor for validation.
    
- Displays the Flutter version when the container starts.

---

##  Getting Started

### Prerequisites

* Docker Desktop installed
  
* Docker Engine running

### Build the Docker Image

```bash
docker build -t flutter-docker .
```

### Run the Container

```bash
docker run --rm flutter-docker
```

### Verify Flutter Installation

```bash
flutter --version
```

Expected output:

```text
Flutter 3.24.0
```

---

##  Concepts Demonstrated

* Docker Image Creation
  
* Dockerfile Instructions
  
* Containerization
  
* Environment Configuration
  
* Dependency Management
  
* Flutter SDK Installation
  
* Reproducible Development Environments

---

##  Learning Objectives

This project was created to understand:

* Docker fundamentals
  
* Container lifecycle
  
* Building custom Docker images
  
* Environment isolation
  
* Flutter setup automation
  
* Development environment portability

---

##  Future Enhancements

* Add Android SDK support
  
* Add Flutter Web support
  
* Multi-stage Docker builds
  
* Docker Compose integration
  
* Hot reload support
  
* CI/CD pipeline integration

---


