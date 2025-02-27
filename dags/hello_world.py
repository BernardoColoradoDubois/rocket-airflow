from datetime import datetime

from airflow import DAG
from airflow.decorators import task
from airflow.operators.bash import BashOperator
from airflow.operators.python import PythonOperator
from airflow.utils.dates import days_ago


dag = DAG(dag_id="hello_world_dag", start_date=days_ago(0), schedule="5 12 * * *")

init = BashOperator(task_id="init", bash_command="echo hello")

# Python Operator Task 1
@task(task_id='python_task_1',dag=dag)
def python_task_1():
  print("Hello World from Python Task 1")
  
init >> python_task_1()