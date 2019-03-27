node{

   def app
	currentBuild.result = "SUCCESS"
   try{
         stage('Repos-GIT'){
    
         git 'https://github.com/SeigaEyoub/click-count.git'
    
        }
        
        stage('Build docker image'){
        
         sh 'pwd'
         sh 'cd /var/lib/jenkins/workspace/clickCount'
         sh '/usr/local/bin/docker-compose up'
    
        }

   }catch (err) {
		currentBuild.result = "FAILURE"
		throw err
	}  
}