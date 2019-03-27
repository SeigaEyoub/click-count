node{

   def app
	currentBuild.result = "SUCCESS"
   try{
         stage('Repos-GIT'){
    
         git 'https://github.com/SeigaEyoub/click-count.git'
    
        }
        stage('MVN package'){

		 def mvnHome = tool name: 'maven3', type: 'maven'
		 def mvnCMD ="${mvnHome}/bin/mvn"
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