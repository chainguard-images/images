#!/usr/bin/env bash

# Function to check the last command status and exit if it failed
check_status() {
  if [ $? -ne 0 ]; then
    echo "Error: $1"
    exit 1
  fi
}

# Check all pods are running
kubectl get pods
check_status "Failed to get pods"

# Get the name of the scheduler pod
SCHEDULER_POD=$(kubectl get pods -l component=scheduler -o jsonpath="{.items[0].metadata.name}")
check_status "Failed to get scheduler pod"

# Scheduler logs
echo "Scheduler logs:"
kubectl logs $SCHEDULER_POD
check_status "Failed to get scheduler logs"

# Describe scheduler pod
echo "Describe scheduler pod:"
kubectl describe pod $SCHEDULER_POD
check_status "Failed to describe scheduler pod"

# Get the name of the webserver pod
WEBSERVER_POD=$(kubectl get pods -l component=web -o jsonpath="{.items[0].metadata.name}")
check_status "Failed to get webserver pod"

# Start the scheduler as a daemon instead of running in the foreground
# echo "Starting the Airflow scheduler..."
# kubectl exec $WEBSERVER_POD -- nohup airflow scheduler -D &
# sleep 20
# check_status "Failed to start the scheduler"

# Create an example DAG file
cat <<EOF > example_dag.py
from airflow import DAG
from airflow.operators.dummy_operator import DummyOperator
from datetime import datetime

default_args = {
    'owner': 'airflow',
    'start_date': datetime(2023, 1, 1),
    'retries': 1,
}

dag = DAG('example_dag', default_args=default_args, schedule_interval='@daily')

start = DummyOperator(task_id='start', dag=dag)
end = DummyOperator(task_id='end', dag=dag)

start >> end
EOF
check_status "Failed to create example DAG file"

chmod 755 example_dag.py

# Create an airflow execution script
cat <<EOF > airflow_run.sh
#!/bin/bash

# Start the scheduler in the background
airflow scheduler -D &

# Wait a few seconds to ensure the scheduler has started
sleep 100

# Trigger the DAG
airflow dags trigger example_dag
EOF

chmod 755 example_dag.py airflow_run.sh

# Copy the DAG file to the Airflow webserver pod
kubectl cp example_dag.py $WEBSERVER_POD:/opt/airflow/dags/example_dag.py
kubectl cp airflow_run.sh $WEBSERVER_POD:/opt/airflow/start_and_trigger.sh
check_status "Failed to copy files to webserver pod"


# Trigger the DAG
kubectl exec $WEBSERVER_POD -- /bin/bash /opt/airflow/start_and_trigger.sh
check_status "Failed to trigger DAG"

# Wait for a few seconds to let the DAG run
sleep 10

# Get the name of the worker pod
WORKER_POD=$(kubectl get pods -l component=worker -o jsonpath="{.items[0].metadata.name}")
check_status "Failed to get worker pod"

# Check worker logs to verify task execution
echo "Worker logs:"
kubectl logs $WORKER_POD
check_status "Failed to get worker logs"

echo "Script completed successfully"
