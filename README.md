# k8s-airflow
k8s airflow

# Criando localmente

Instale o Kind e execute

```sh
kind create cluster --name airflow --config k8s/kind-nodes.yaml
```

# K8s config

```sh
helm upgrade --install airflow apache-airflow/airflow --namespace airflow --create-namespac
```

## Airflow Docker Dags

```
docker build --pull --tag my-dag -f airflow-dags/Dockerfile .
```

Depois adicionei a imagem para dentro do cluster kind

```
kind load docker-image my-dag:latest --name dev-local
```

E atualize o seu airflow k8s

```
helm upgrade airflow apache-airflow/airflow --namespace airflow --values values-airflow.yaml
```