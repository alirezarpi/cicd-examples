# Practice #01

## Agenda

Technologies used in this practice is as follows:
- Vault (Secret Management)
- Consul (Env Var Management)
- Kubernetes (Orchestrator)
- Helm (Kubernetes Packaging)
- ArgoCD (CD Part)
- Docker (Image Packaging)
- Gitlab-CI (CI Part) ---> **using external ci-cd repository**

**Note:** Vault integration is used in both ways, **Side Car Agent** and **EnvConsul Pull**. 

Also if you're little confused browsing the practice-1, it's ok because it's not well-documented
and there's alot going on there; So please, you're more than welcome in contributing in documentation.

--- 

## Directories and Files

**This practice-01 directory tree:**

```
base-images: consists of base images needed for the projects, I used bitnami based, and needed to install `envconsul` on images.

stateful-services: consists of stateful applications with the `helm charts` helps included.
        |_ policies: consists of `vault` policies needed to application launch - for statefulsets is `side-car vault` integration.

stateless-services: consists of stateless applications with the `helm charts` directory included.
        |- cd-build: consists of `helm charts` specific for the application.
            |_ templates: conists of `helm charts` templates.
        |- ci-build: cosists of Dockerfiles and entrypoints needed for the application.
        |_ policies: consists of `vault` policies needed to application launch - for stateless is using `envconsul` integration.
```