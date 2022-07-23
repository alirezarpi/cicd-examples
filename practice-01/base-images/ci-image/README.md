# The Base CI Image

The base ci image is made for the purpose of having only one image to support all stages tasks.

### Installation

For installing the base ci image:
```
$ docker build -f ./base.Dockerfile -t <your-repository-url>/infrastructure/ci-cd/ci-base-image:0.0.2 .
$ docker push <your-repository-url>/infrastructure/ci-cd/ci-base-image:0.0.2
```
