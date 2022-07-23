# Statefull Applications

Check if you're on right cluster and then proceed.

## Authenticate Kubernetes to Vault

```
$ helm repo add hashicorp https://helm.releases.hashicorp.com
$ helm repo update
```

## Apply Vault Policies and Kubernetes RoleBindings

In each stateful directory we have directory named `policies`, please Read the README.md.

## Apply the HELM Command

In the root of each stateful application we have README.md that consists of the `helm` command that is used 
to run the application on the desired namespace.
