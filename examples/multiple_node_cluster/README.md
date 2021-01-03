# A Multiple Node cluster

This is an example of a multiple node kubernetes cluster on AWS using RKE (Rancher Kubernetes Engine).

To create:

```shell
terraform init
terraform apply --auto-approve
```

From outputs, grab the export_kubeconfig_command:

```shell
export KUBECONFIG=k8s/kubeconfig.yaml
```

Let's have a look at the nodes:

```shell
kubectl get no
```

```
NAME                                       STATUS   ROLES               AGE     VERSION
ip-10-0-2-138.eu-west-2.compute.internal   Ready    controlplane,etcd   4m10s   v1.19.4
ip-10-0-2-234.eu-west-2.compute.internal   Ready    worker              4m8s    v1.19.4
ip-10-0-2-54.eu-west-2.compute.internal    Ready    worker              4m8s    v1.19.4
```

Let's have a look at everything else:

```shell
kubectl get all -A
```

```
NAMESPACE       NAME                                           READY   STATUS      RESTARTS   AGE
ingress-nginx   pod/default-http-backend-65dd5949d9-28gw7      1/1     Running     0          4m14s
ingress-nginx   pod/nginx-ingress-controller-4xgcn             1/1     Running     0          4m14s
ingress-nginx   pod/nginx-ingress-controller-rxw4n             1/1     Running     0          4m14s
kube-system     pod/calico-kube-controllers-649b7b795b-2m7x4   1/1     Running     0          4m26s
kube-system     pod/canal-fqdgn                                2/2     Running     0          4m26s
kube-system     pod/canal-hwk9x                                2/2     Running     0          4m26s
kube-system     pod/canal-kshmc                                2/2     Running     0          4m26s
kube-system     pod/coredns-6f85d5fb88-hk8pv                   1/1     Running     0          3m50s
kube-system     pod/coredns-6f85d5fb88-m6ln4                   1/1     Running     0          4m25s
kube-system     pod/coredns-autoscaler-79599b9dc6-jd6jr        1/1     Running     0          4m24s
kube-system     pod/metrics-server-8449844bf-szrrw             1/1     Running     0          4m20s
kube-system     pod/rke-coredns-addon-deploy-job-b6d7q         0/1     Completed   0          4m26s
kube-system     pod/rke-ingress-controller-deploy-job-d4wtc    0/1     Completed   0          4m16s
kube-system     pod/rke-metrics-addon-deploy-job-jmwp9         0/1     Completed   0          4m21s
kube-system     pod/rke-network-plugin-deploy-job-htlq5        0/1     Completed   0          4m30s

NAMESPACE       NAME                           TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)                  AGE
default         service/kubernetes             ClusterIP   10.43.0.1       <none>        443/TCP                  4m51s
ingress-nginx   service/default-http-backend   ClusterIP   10.43.254.63    <none>        80/TCP                   4m14s
kube-system     service/kube-dns               ClusterIP   10.43.0.10      <none>        53/UDP,53/TCP,9153/TCP   4m25s
kube-system     service/metrics-server         ClusterIP   10.43.250.187   <none>        443/TCP                  4m20s

NAMESPACE       NAME                                      DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE
ingress-nginx   daemonset.apps/nginx-ingress-controller   2         2         2       2            2           <none>                   4m14s
kube-system     daemonset.apps/canal                      3         3         3       3            3           kubernetes.io/os=linux   4m27s

NAMESPACE       NAME                                      READY   UP-TO-DATE   AVAILABLE   AGE
ingress-nginx   deployment.apps/default-http-backend      1/1     1            1           4m14s
kube-system     deployment.apps/calico-kube-controllers   1/1     1            1           4m27s
kube-system     deployment.apps/coredns                   2/2     2            2           4m25s
kube-system     deployment.apps/coredns-autoscaler        1/1     1            1           4m25s
kube-system     deployment.apps/metrics-server            1/1     1            1           4m20s

NAMESPACE       NAME                                                 DESIRED   CURRENT   READY   AGE
ingress-nginx   replicaset.apps/default-http-backend-65dd5949d9      1         1         1       4m14s
kube-system     replicaset.apps/calico-kube-controllers-649b7b795b   1         1         1       4m27s
kube-system     replicaset.apps/coredns-6f85d5fb88                   2         2         2       4m25s
kube-system     replicaset.apps/coredns-autoscaler-79599b9dc6        1         1         1       4m25s
kube-system     replicaset.apps/metrics-server-8449844bf             1         1         1       4m20s

NAMESPACE     NAME                                          COMPLETIONS   DURATION   AGE
kube-system   job.batch/rke-coredns-addon-deploy-job        1/1           2s         4m26s
kube-system   job.batch/rke-ingress-controller-deploy-job   1/1           2s         4m16s
kube-system   job.batch/rke-metrics-addon-deploy-job        1/1           2s         4m21s
kube-system   job.batch/rke-network-plugin-deploy-job       1/1           4s         4m31s
```

To destroy:

```shell
terraform destro --auto-approve
```