node{

         stage('Repos-GIT'){
    
         git 'https://github.com/SeigaEyoub/click-count.git'
    
        }
       
        stage('MVN package'){
         
             def mvnHome = tool name: 'maven-3', type: 'maven'
             def mvnCMD ="${mvnHome}/bin/mvn"
             def JAVA_HOME='/usr/lib/jvm/jre-1.8.0-openjdk.x86_64'
             sh "${mvnCMD} clean package"

        }
        stage('build docker image'){
         sh 'docker build . -t eseiga/clickcountdemo:1'
        }
        stage('Push docker image'){
         withCredentials([string(credentialsId: 'dockerhubEseiga', variable: 'dockerHubPasswd')]) {
                sh 'docker login -u eseiga -p ${dockerHubPasswd}'
             } 
             
             sh 'docker push eseiga/clickcountdemo:1' 
        }
        
        stage('Deploy dev'){
            sh 'docker ps -f name=redis-session-store -q | xargs --no-run-if-empty docker container stop'
            sh 'docker ps -f name=optimistic_benz -q | xargs --no-run-if-empty docker container stop'
            sh 'docker run --rm -d --name redis-session-store redis'
            sh 'docker run --rm -d --link redis-session-store:redis -p 8088:8080 eseiga/clickcountdemo:1'
       
        }
       
}