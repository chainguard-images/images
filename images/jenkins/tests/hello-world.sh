#!/bin/sh

# set -euo pipefail

apk add curl openjdk-21-jre-base

export JAVA_HOME=/usr/lib/jvm/java-21-openjdk/
kubectl get svc -A
kubectl port-forward -n jenkins svc/jenkins 8080:8080&
sleep 5 # wait for port-forward to settle
curl -s -O "http://localhost:8080/jnlpJars/jenkins-cli.jar"
mv jenkins-cli.jar /tmp/

# define a job
cat /tests/hello-world.xml | \
	$JAVA_HOME/bin/java \
	-jar /tmp/jenkins-cli.jar \
	-s http://127.0.0.1:8080 \
	create-job "Hello world"

sleep 5 # wait for port-forward to settle

# run the job
$JAVA_HOME/bin/java \
	-jar /tmp/jenkins-cli.jar \
	-s http://127.0.0.1:8080 build "Hello world"

sleep 5 # wait for port-forward to settle

# check job success
STATUS=`$JAVA_HOME/bin/java \
	-jar /tmp/jenkins-cli.jar \
	-s http://127.0.0.1:8080 console "Hello world" |grep 'Finished: SUCCESS'`

