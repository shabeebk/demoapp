# Getting Started with Docker / Nginx / ReactJS / Jenkins Pipeline

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

Using this repository, you will be able to deploy a demo ReactJS app in a container and serve it with an Nginx inside the container.

## What all it includes?  
In the project directory, you can see
1. Jenkinsfile : This file is to be used to run the jenkins pipeline for this project. During pipeline run, jenkins job will launch a docker container of node and run the test in the code after installing all package dependencies. Then the job will copy all code to the instance, build the image inside the instance and deploy the docker image which contains Nginx and ReactJS application.
2. Dockerfile : This is a multi stage Dockerfile which can be used to build the image which contains ReactJS application and Nginx web server in it. This file will also generates a self signed SSL certificate for Nginx.
3. docker-compose.yml : This file can be used to deploy the instance of docker container. This file will take care of building the image to be deployed. This file also takes care of the port mapping betwwen docker container and host.
4. conf : This folder contains the config file for Nginx web server.
5. ReactJS application source code : The application code.

### Deployment of docker container.

Do clone the repository in your local machine and run `docker-compose up --force-recreate --build -d` **(sudo required if you do not have admin access)** inside the directory if you wanted to build the image and run the container locally.  
**[sudo required while using the linux bash commands (like docker-compose) if you do not have admin access]**  
To test if this has launched the container, please use `docker-compose ps`.

**Note: This is not recommended for production setup! There are a lot of flaws in this.**  
**1. This setup is not using the lightweight Nginx docker image.**  
**2. This setup is not using a CA certified chained SSL certificate. Instead uses the self signed certificate.**  
**3. In this setup, ReactJS app is served as static build files. To run app as a dynamic application, we should use multiple container, in which once will serve the app and the other will be nginx web server.**   
**4. Static IP address of the instance is not being passed as variable/env. The current way in which this module is written is not recommended.**  
**5. Most of the steps in deployment pipeline is just bash script. We should be able to make use of leverages by using different plugins instead of this plain bash script.**  
