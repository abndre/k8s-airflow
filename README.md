# k8s-airflow
k8s airflow

# Criando localmente

Instale o Kind e execute

```sh
kind create cluster --name airflow --config k8s/kind-nodes.yaml
```

# K8s config


```
kubectl cluster-info --context kind-airflow
```

```sh
helm repo add apache-airflow https://airflow.apache.org
helm upgrade --install airflow apache-airflow/airflow --namespace airflow --create-namespace
```




## Airflow Docker Dags

```
docker build --pull --tag my-dag -f Dockerfile .
docker build --pull --tag pod-dag -f Dockerfile .
```

Depois adicionei a imagem para dentro do cluster kind

```
kind load docker-image my-dag:latest --name airflow
kind load docker-image pod-dag:latest --name airflow
```

E atualize o seu airflow k8s

```
helm upgrade airflow apache-airflow/airflow --namespace airflow --create-namespace --values values-airflow.yaml
```

```
kubectl port-forward svc/airflow-webserver 8080:8080 --namespace airflow --address 0.0.0.0
```