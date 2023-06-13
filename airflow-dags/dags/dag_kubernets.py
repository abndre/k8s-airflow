from datetime import datetime, timedelta
from airflow import DAG
from airflow.contrib.operators.kubernetes_pod_operator import KubernetesPodOperator

default_args = {
    'owner': 'seu_nome',
    'start_date': datetime(2023, 6, 12),
    'retries': 0,
    'retry_delay': timedelta(minutes=5),
}

dag = DAG(
    'execucao_scripts',
    default_args=default_args,
    description='Execução de scripts Python usando Kubernetes Operator',
    schedule=None,
)

task1 = KubernetesPodOperator(
    dag=dag,
    namespace='default',
    image='pod-dag:latest',
    cmds=['python', '-e', 'SCRIPT_NAME=script1.py'],
    name='execucao-script1',
    task_id='execucao-script1-task',
    in_cluster=True,  # if set to true, will look in the cluster, if false, looks for file
    is_delete_operator_pod=True,
    get_logs=True,
)

task2 = KubernetesPodOperator(
    dag=dag,
    namespace='default',
    image='pod-dag:latest',
    cmds=['python', '-e', 'SCRIPT_NAME=script2.py'],
    name='execucao-script2',
    task_id='execucao-script2-task',
    in_cluster=True,  # if set to true, will look in the cluster, if false, looks for file
    is_delete_operator_pod=True,
    get_logs=True,
)

# (task1, task2)
