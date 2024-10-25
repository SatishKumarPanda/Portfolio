pipeline {
    agent any
    
    stages {
        stage("Code") {
            steps {
                echo "clone the code"
                git url:"https://github.com/LondheShubham153/django-notes-app.git", branch: "main"
            }
        }
        
        stage("Build") {
            steps {
                echo "Building the image"
                sh "docker build -t my-notes-app ."
            }
        }
       stage("Push to Docker Hub") {
       steps {
        echo "Building the code"
        withCredentials([usernamePassword(credentialsId: "dockerHub", passwordVariable: "dockerHubPass", usernameVariable: "dockerHubUser")]) {
            sh "docker tag my-notes-app ${dockerHubUser}/my-notes-app:latest"
            sh "docker login -u ${dockerHubUser} -p ${env.dockerHubPass}"
            sh "docker push ${dockerHubUser}/my-notes-app:latest"
        }
    }
}

        
        stage("Deploy") {
            steps {
                echo "Deploying the code"
                sh "docker-compose down && docker-compose up -d"
            }
        }
    }
}
