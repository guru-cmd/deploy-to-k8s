#get hash values from recent commit
GIT_SHA=$(git rev-parse HEAD)

#build the docker image with recent git comit hash
docker build -t guru3344/static-website-k8s:$GIT_SHA .

#push the image to docker hub
#docker login
docker push guru3344/static-website-k8s:$GIT_SHA

#Apply the K8S objects
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/

#update the image in deployment resource/deployment yaml file
kubectl set image deployment.apps/static-web-deployment -n=sample days-app-container=gur3344/static-website-k8s:$GIT_SHA
