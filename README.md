
#### pre-requis: 
   - docker 
   - git
   -jenkins
   
 #### L'application est installé sur une instance linux de aws et le job jenkins a été créé par les piplines voir JenkinsFile
   -Job Jenkins : http://35.180.169.199:8080/job/clickCount/  
   -Application : http://35.180.169.199:8088/clickCount/
   
   connexion Jenkins visitor/123456
 

#### pour lancer l'application sans jenkins
 
 git clone https://github.com/SeigaEyoub/click-count.git
 cd click-count
 docker-compose up
