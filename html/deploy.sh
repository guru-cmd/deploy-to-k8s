# get the git hash values
GIT_SHA= $(git rev-parse HEAD)

#build the docker imager with recent git comit hash
doker build -t gur3344/static-website-k8s:$GIT_SHA .

#
