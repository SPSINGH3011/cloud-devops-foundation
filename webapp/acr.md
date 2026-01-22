🔹 Step 2: Build Docker image
docker build -t java-login-practice .
docker build -t java-login-myapp .

Step 3: Run container
docker run -d -p 8080:8080 --name java-login-app java-login-practice

🌐 Access Application
http://localhost:8080/JavaLoginPracticeApp


docker ps
docker logs java-login-app



#################   locallly
Login server
weappacr.azurecr.io

acr name 
weappacr



image name -----   java-login-practice


Login to ACR
      az acr login --name weappacr

   tag to acr
   docker tag <local-image>:<tag> <acr-login-server>/<image-name>:<tag>
      docker tag java-login-practice:latest weappacr.azurecr.io/java-login-practice:latest


 push to acr
       docker push weappacr.azurecr.io/java-login-practice:latest

##trouble shoot

az acr repository list --name weappacr --output table

domain:
mywebapps-cbg0gvgjbka6dagu.centralindia-01.azurewebsites.net

Access:
https://mywebapps-cbg0gvgjbka6dagu.centralindia-01.azurewebsites.net/JavaLoginPracticeApp

https://mymewebapp-cudqgzctdaeaatdz.centralindia-01.azurewebsites.net/JavaLoginPracticeApp
