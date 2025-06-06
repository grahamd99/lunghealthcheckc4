## Introduction

Just a README file ...

## Repository Structure

- `/structurizr`: Contains the solution architecture model and related files

## Getting Started

### 1. Lung Health Check as-is Model (Structurizr)

To work with the model, you'll need to run Structurizr Lite locally. This requires Docker installation.

#### Prerequisites

- Docker installed from [https://www.docker.com/get-started/](https://www.docker.com/get-started/)

#### Running Structurizr

First, pull the latest Structurizr lite image:

```bash
docker pull structurizr/lite
```

Then run the container (commands vary by operating system):

##### MacOS and Linux

```bash
cd structurizr
docker run -it --rm -p 8080:8080 -v ./:/usr/local/structurizr structurizr/lite
```

Note: For MacOS Sequoia 15.2 and later, use this command instead to avoid sigterm exceptions:

```bash
cd structurizr
docker run --rm -e JAVA_TOOL_OPTIONS="-XX:UseSVE=0" -p 8080:8080 -v ./:/usr/local/structurizr structurizr/lite
```

##### Windows

```bash
cd structurizr
docker run -it --rm -p 8080:8080 -v %cd%:/usr/local/structurizr structurizr/lite
```

Once running, access the live view at http://localhost:8080