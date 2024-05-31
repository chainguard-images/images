#!/bin/sh

set -exo

apk add curl openjdk-21-jre-base

export JAVA_HOME=/usr/lib/jvm/java-21-openjdk/

JENKINS_ADMIN_PASSWORD=$(kubectl get secret --namespace jenkins jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 -d)
JENKINS_ADMIN_USER=$(kubectl get secret --namespace jenkins jenkins -o jsonpath="{.data.jenkins-admin-user}" | base64 -d)
JENKINS_URL="http://localhost:8080"

kubectl port-forward -n jenkins svc/jenkins 8080:8080 &

until curl -s --head --request GET "${JENKINS_URL}/login" | grep "200 OK" >/dev/null; do
	sleep 1
done

curl -s -O "http://localhost:8080/jnlpJars/jenkins-cli.jar"
mv jenkins-cli.jar /tmp/

# Define a job
cat /tests/hello-world.xml |
	$JAVA_HOME/bin/java \
		-jar /tmp/jenkins-cli.jar \
		-s ${JENKINS_URL} \
		-auth ${JENKINS_ADMIN_USER}:${JENKINS_ADMIN_PASSWORD} \
		create-job "Hello world"

# Run the job and wait for it to complete
BUILD_NUMBER=$($JAVA_HOME/bin/java \
	-jar /tmp/jenkins-cli.jar \
	-s ${JENKINS_URL} \
	-auth ${JENKINS_ADMIN_USER}:${JENKINS_ADMIN_PASSWORD} \
	build "Hello world" -s)

# Check job success
BUILD_STATUS=$($JAVA_HOME/bin/java \
	-jar /tmp/jenkins-cli.jar \
	-s ${JENKINS_URL} \
	-auth ${JENKINS_ADMIN_USER}:${JENKINS_ADMIN_PASSWORD} \
	console "Hello world" | grep 'Finished: SUCCESS')

if [ -n "$BUILD_STATUS" ]; then
	echo "Job succeeded"
else
	echo "Job failed"
fi
