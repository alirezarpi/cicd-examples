# Config Server Policies

## What is this directory
In order for both CI and APP to access its revelant Configurations (vars/secrets) it should be able to authenticate with 
both Vault and Consul.

## How to apply them
It is important to apply these policies because without them both CI and APP wont work !

>Do remember that we have a policy named `gitlab-ci` created before that has some permissions, refer to this link

Apply the `application` policy:
```
$ vault policy write demo-app ./vault-policy.hcl
```

and also the role for CI access:
```
$ vault write auth/jwt/role/demo-app-role @vault-ci-role.json
```
