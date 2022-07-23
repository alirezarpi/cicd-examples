# The Base Java Image

The base java image is made for the purpose of the same image for running production environment that is secure too.

### Installation

For installing the base ci image:
```
$ BASE_IMAGE_TAG=17-debian-11
$ docker build --build-arg BASE_IMAGE_TAG=$BASE_IMAGE_TAG -f ./base.Dockerfile -t <your-repository-url>/infrastructure/ci-cd/java-base-image:$BASE_IMAGE_TAG .
$ docker push <your-repository-url>/infrastructure/ci-cd/java-base-image:$BASE_IMAGE_TAG
```
