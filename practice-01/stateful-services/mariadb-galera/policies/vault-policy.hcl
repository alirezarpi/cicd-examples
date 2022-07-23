

# -------- renew stuff --------
path "auth/token/renew-self" {
  capabilities = ["create", "update", "read"]
}

path "auth/token/lookup-self" {
  capabilities = ["create", "update", "read"]
}

# -------- mariadb-galera --------
path "<your-vault-secret-path>/stateful/mariadb-galera/*" {
  capabilities = [ "read", "list" ]
}
