# Hello, World!

Build:

```bash
dotnet build
```

Run:

```bash
dotnet run
```

Build Docker image:

```bash
docker build --tag johnmorsley/hello-world:v1 .
```

Run Docker image:

```bash
docker run --publish 5000:5000 johnmorsley/hello-world:v1
```

And browse to: http://localhost:5000/greeting

To upload Docker image to Docker Hub:

```bash
docker login --username=johnmorsley
docker push johnmorsley/hello-world:v1
```

To deploy the application to Kubernetes:

```bash
kubectl apply --filename deployment.yaml 
```

To expose the deployment on Kubernetes:

```bash
kubectl apply --filename service.yaml 
```

To prune Docker:

```bash
 docker image prune --force --all
```
 
```bash
 docker system prune --force
```