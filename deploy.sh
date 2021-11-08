#get hash values from recent commit
GIT_SHA= $(git rev-parse HEAD)

#build the docker image with recent git comit hash
doker build -t gur3344/static-website-k8s:$GIT_SHA .

#push the image to docker hub
docker push gur3344/static-website-k8s:$GIT_SHA

#Apply the K8S objects
kubctl apply -f k8s/namespace.yaml
kubctl apply -f k8s/

#update the image in deployment resource/deployment yaml file
kubctl set image deployment.apps/static-web-deployment -n=sample days-app-container=gur3344/static-website-k8s:$GIT_SHA
