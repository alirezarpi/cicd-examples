# STS Vault Stuff

```
SA=mariadb-galera-vault-sa
NS=mariadb-galera-ns
kubectl apply -f ./policies/vault-rb.yml
VAULT_HELM_SECRET_NAME=$(kubectl get -n $NS secrets --output=json | jq -r '.items[1].metadata | select(.name|startswith("mariadb-galera-vault-sa-token-")).name')
kubectl describe -n $NS secret $VAULT_HELM_SECRET_NAME
TOKEN_REVIEW_JWT=$(kubectl get -n $NS secret $VAULT_HELM_SECRET_NAME --output='go-template={{ .data.token }}' | base64 --decode)
KUBE_CA_CERT=$(kubectl config view --raw --minify --flatten --output='jsonpath={.clusters[].cluster.certificate-authority-data}' | base64 --decode)
KUBE_HOST=$(kubectl config view --raw --minify --flatten --output='jsonpath={.clusters[].cluster.server}')
helm install mariadb-galera-vault hashicorp/vault --set "injector.externalVaultAddr=https://vault-addr" --namespace $NS
```

```
vault write auth/the-cluster/config \
     token_reviewer_jwt="$TOKEN_REVIEW_JWT" \
     kubernetes_host="$KUBE_HOST" \
     kubernetes_ca_cert="$KUBE_CA_CERT" \
     issuer="https://kubernetes.default.svc.cluster.local"
```

- First create the policy for reading secrets for the STS.

Then apply the role for the specific policy and then apply the policy for the and the role STS:
```
STS_POLICY=mariadb-galera-demo
vault policy write $STS_POLICY ./policies/vault-policy.hcl
vault write auth/the-cluster/role/mariadb-galera-role \
     bound_service_account_names=$SA \
     bound_service_account_namespaces=$NS \
     policies=$STS_POLICY \
     ttl=24h
```

and add/patch these to `metadata.annotations` of the sts, also add the `vault-sa` to each sts `spec.serviceAccountName`. 
