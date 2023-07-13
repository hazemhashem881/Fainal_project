kubectl create namespace jenkins
kubectl apply -f jenkinspv.yml
kubectl apply -f jenkinspvc.yml
kubectl apply -f jenkins-service.yml
kubectl apply -f jenkinsaccount.yml
kubectl apply -f jenkinsdeployment.yml
kubectl apply -f jenkins-slave-svc.yaml
kubectl apply -f jenkins-slave-deploy.yml
