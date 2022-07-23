# MongoDB Sharded

## Before you apply

For the installation we're using bitnami helm repositories.
```
$ helm repo add bitnami https://charts.bitnami.com/bitnami
```

Then check if you're on the right kubernetes cluster:
```
$ kubectl cluster-info
```

And create the namespace:
```
$ kubectl create namespace mariadb-galera-ns
```

Make sure you apply `vault` policies first in the `./policies` directory.

## Installation

Then install it via proper environments:

```
$ helm install mariadb-galera-sts  --values ./demo.values.yml bitnami/mariadb-galera  --namespace=mariadb-galera-ns
```

this should be logged:
```
** Please be patient while the chart is being deployed **
Tip:

  Watch the deployment status using the command:

    kubectl get sts -w --namespace mariadb-galera-ns -l app.kubernetes.io/instance=mariadb-galera-sts

MariaDB can be accessed via port "3306" on the following DNS name from within your cluster:

    mariadb-galera-sts.mariadb-galera-ns.svc.cluster.local

To obtain the password for the MariaDB admin user run the following command:

    echo "$(kubectl get secret --namespace mariadb-galera-ns mariadb-galera-sts -o jsonpath="{.data.mariadb-root-password}" | base64 -d)"

To connect to your database run the following command:

    kubectl run mariadb-galera-sts-client --rm --tty -i --restart='Never' --namespace mariadb-galera-ns --image docker.io/bitnami/mariadb-galera:10.6.8-debian-11-r9 --command \
      -- mysql -h mariadb-galera-sts -P 3306 -uuser -p$(kubectl get secret --namespace mariadb-galera-ns mariadb-galera-sts -o jsonpath="{.data.mariadb-password}" | base64 -d) mariadb_cluster

To connect to your database from outside the cluster execute the following commands:

    kubectl port-forward --namespace mariadb-galera-ns svc/mariadb-galera-sts 3306:3306 &
    mysql -h 127.0.0.1 -P 3306 -uuser -p$(kubectl get secret --namespace mariadb-galera-ns mariadb-galera-sts -o jsonpath="{.data.mariadb-password}" | base64 -d) mariadb_cluster

To upgrade this helm chart:

    helm upgrade --namespace mariadb-galera-ns mariadb-galera-sts bitnami/mariadb-galera \
      --set rootUser.password=$(kubectl get secret --namespace mariadb-galera-ns mariadb-galera-sts -o jsonpath="{.data.mariadb-root-password}" | base64 -d) \
      --set db.user=user --set db.password=$(kubectl get secret --namespace mariadb-galera-ns mariadb-galera-sts -o jsonpath="{.data.mariadb-password}" | base64 -d) --set db.name=mariadb_cluster \
      --set galera.mariabackup.password=$(kubectl get secret --namespace mariadb-galera-ns mariadb-galera-sts -o jsonpath="{.data.mariadb-galera-mariabackup-password}" | base64 -d)
```

## Monitor the cluster
```
$ kubectl get --namespace mariadb-galera-ns deploy,sts,pods,svc,secrets,replicaset,sa,pvc
```

## Delete the cluster

```
$ helm uninstall mariadb-galera-sts --namespace mariadb-galera-ns && kubectl delete -n mariadb-galera-ns pvc --all
```
