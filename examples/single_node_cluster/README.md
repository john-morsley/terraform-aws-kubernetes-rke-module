# A Single Node cluster

This is an example of a single node kubernetes cluster on AWS using RKE (Rancher Kubernetes Engine).

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
NAME                                       STATUS   ROLES                      AGE     VERSION
ip-10-0-2-102.eu-west-2.compute.internal   Ready    controlplane,etcd,worker   4m54s   v1.19.4
```

Let's have a look at everything else:

```shell
kubectl get all -A
```

```
NAMESPACE       NAME                                           READY   STATUS      RESTARTS   AGE
ingress-nginx   pod/default-http-backend-65dd5949d9-k5vk6      1/1     Running     0          4m41s
ingress-nginx   pod/nginx-ingress-controller-j69nv             1/1     Running     0          4m41s
kube-system     pod/calico-kube-controllers-649b7b795b-69c59   1/1     Running     0          4m53s
kube-system     pod/canal-8mkph                                2/2     Running     0          4m53s
kube-system     pod/coredns-6f85d5fb88-jw2td                   1/1     Running     0          4m51s
kube-system     pod/coredns-autoscaler-79599b9dc6-wh94p        1/1     Running     0          4m50s
kube-system     pod/metrics-server-8449844bf-298l7             1/1     Running     0          4m45s
kube-system     pod/rke-coredns-addon-deploy-job-qqvtf         0/1     Completed   0          4m52s
kube-system     pod/rke-ingress-controller-deploy-job-tknz9    0/1     Completed   0          4m42s
kube-system     pod/rke-metrics-addon-deploy-job-29bsv         0/1     Completed   0          4m47s
kube-system     pod/rke-network-plugin-deploy-job-q7h7z        0/1     Completed   0          4m57s

NAMESPACE       NAME                           TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)                  AGE
default         service/kubernetes             ClusterIP   10.43.0.1       <none>        443/TCP                  5m26s
ingress-nginx   service/default-http-backend   ClusterIP   10.43.167.223   <none>        80/TCP                   4m41s
kube-system     service/kube-dns               ClusterIP   10.43.0.10      <none>        53/UDP,53/TCP,9153/TCP   4m51s
kube-system     service/metrics-server         ClusterIP   10.43.180.41    <none>        443/TCP                  4m46s

NAMESPACE       NAME                                      DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE
ingress-nginx   daemonset.apps/nginx-ingress-controller   1         1         1       1            1           <none>                   4m41s
kube-system     daemonset.apps/canal                      1         1         1       1            1           kubernetes.io/os=linux   4m54s

NAMESPACE       NAME                                      READY   UP-TO-DATE   AVAILABLE   AGE
ingress-nginx   deployment.apps/default-http-backend      1/1     1            1           4m41s
kube-system     deployment.apps/calico-kube-controllers   1/1     1            1           4m54s
kube-system     deployment.apps/coredns                   1/1     1            1           4m51s
kube-system     deployment.apps/coredns-autoscaler        1/1     1            1           4m51s
kube-system     deployment.apps/metrics-server            1/1     1            1           4m46s

NAMESPACE       NAME                                                 DESIRED   CURRENT   READY   AGE
ingress-nginx   replicaset.apps/default-http-backend-65dd5949d9      1         1         1       4m41s
kube-system     replicaset.apps/calico-kube-controllers-649b7b795b   1         1         1       4m54s
kube-system     replicaset.apps/coredns-6f85d5fb88                   1         1         1       4m51s
kube-system     replicaset.apps/coredns-autoscaler-79599b9dc6        1         1         1       4m51s
kube-system     replicaset.apps/metrics-server-8449844bf             1         1         1       4m46s

NAMESPACE     NAME                                          COMPLETIONS   DURATION   AGE
kube-system   job.batch/rke-coredns-addon-deploy-job        1/1           2s         4m52s
kube-system   job.batch/rke-ingress-controller-deploy-job   1/1           2s         4m42s
kube-system   job.batch/rke-metrics-addon-deploy-job        1/1           2s         4m47s
kube-system   job.batch/rke-network-plugin-deploy-job       1/1           4s         4m57s
```

To destroy:

```shell
terraform destro --auto-approve
```