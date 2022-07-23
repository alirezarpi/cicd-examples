# Demo App

## Before you start

>This part needs more documentation, please let me know if you want to get the procedure.

## Build Image

Note that all docker build run in root of project:
```
docker build -f ./ci-build/Dockerfile \
    --build-arg SECRET_PATH=$SECRET_PATH \
    --build-arg VARIABLE_PATH=$VARIABLE_PATH \
    -t <your-repository-url>/demo/demo-app:test .
```

## ImagePullSecret
```
kubectl create secret docker-registry $K8S_REG_SECRET --docker-server=$REG_HOST --docker-username='$REG_USER' --docker-password=$REG_PASSWORD --namespace $K8S_NAMESPACE
```

