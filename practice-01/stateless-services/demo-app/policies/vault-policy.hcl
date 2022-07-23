

# -------- renew stuff --------
path "auth/token/renew-self" {
  capabilities = ["create", "update", "read"]
}

path "auth/token/lookup-self" {
  capabilities = ["create", "update", "read"]
}

# -------- demo-app --------
path "<your-vault-secret-path>/stateless/demo-app/*" {
  capabilities = [ "read", "list" ]
}
