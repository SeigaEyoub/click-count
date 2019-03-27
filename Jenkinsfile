node{

   def app
	currentBuild.result = "SUCCESS"
   try{
         stage('Repos-GIT'){
    
         git 'https://github.com/SeigaEyoub/click-count.git'
    
        }
       
        stage('MVN package'){
         
         def mvnHome = tool name: 'maven-3', type: 'maven'
         def mvnCMD ="${mvnHome}/bin/mvn"
         def JAVA_HOME='/usr/lib/jvm/jre-1.8.0-openjdk.x86_64'
         sh "${mvnCMD} clean package"

        }
        
        stage('Build docker image'){
        
         sh '/usr/local/bin/docker-compose up'
    
        }
	

   }catch (err) {
		currentBuild.result = "FAILURE"
		throw err
	}  
}