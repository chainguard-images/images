#!/bin/bash

cat << 'EOF' > create_pat.rb

user = User.find_by_username('root')

token = user.personal_access_tokens.create(scopes: ['api'], name: 'root token', expires_at: 365.days.from_now)

token.set_token('token-string-here1234')

token.save!

EOF

POD_NAME=$(kubectl get pods -l app=sidekiq,release=gitlab -o jsonpath='{.items[0].metadata.name}')

if [ -z "${POD_NAME}" ]; then
  echo "No pod found with labels app=sidekiq and release=gitlab"
  exit 1
fi

kubectl cp create_pat.rb "${POD_NAME}":/srv/gitlab/create_pat.rb

kubectl exec "${POD_NAME}" -- /bin/bash -c "cd /srv/gitlab && bin/rails runner /srv/gitlab/create_pat.rb"

rm create_pat.rb

echo "Script execution completed."

test_pat="token-string-here1234"
GITLAB_INSTANCE="localhost"
REPO="minions"
RELEASE_NAME="gitlab"
SSH_KEY_COMMENT="banana"
SSH_KEY="$HOME/.ssh/yellow"
WEB_PORT="8181"
SSH_PORT="32022"
BRANCH="nefario"

check_exit_code() {
    if [ $? -ne 0 ]; then
        echo "An error occurred. Exiting..."
        exit 1
    fi
}

cleanup() {
    if [ $? -ne 0 ]; then
        echo "Test failed."
        if [ -n "${PROJECT_ID}" ]; then
            echo "Cleaning up projects created..."
            curl --request DELETE --header "PRIVATE-TOKEN: ${test_pat}" "http://${GITLAB_INSTANCE}:${WEB_PORT}/api/v4/projects/${PROJECT_ID}"
            rm -rf ${REPO}
        fi
    else
        echo "Test completed successfully. Cleaning up projects created..."
        curl --request DELETE --header "PRIVATE-TOKEN: ${test_pat}" "http://${GITLAB_INSTANCE}:${WEB_PORT}/api/v4/projects/${PROJECT_ID}"
        rm -rf ${REPO}
    fi
}

trap cleanup EXIT

echo "Forwarding web service"
kubectl port-forward svc/"${RELEASE_NAME}"-webservice-default 8181:8181 -n default &
sleep 10

echo "Creating GitLab project..."
PROJECT_ID=$(curl --header "PRIVATE-TOKEN: ${test_pat}" --data "name=${REPO}" "http://${GITLAB_INSTANCE}:${WEB_PORT}/api/v4/projects" | jq -r '.id')
check_exit_code
echo "Created project with ID: ${PROJECT_ID}"

echo "Generating SSH key..."
ssh-keygen -t rsa -b 4096 -C "${SSH_KEY_COMMENT}" -f "${SSH_KEY}" -N "" <<< y
check_exit_code

chmod 600 ${SSH_KEY}
chmod 644 "${SSH_KEY}.pub"
check_exit_code

echo "Starting SSH agent..."
eval "$(ssh-agent -s)"
check_exit_code

echo "Adding SSH key to agent..."
ssh-add ${SSH_KEY}
check_exit_code


PUBLIC_SSH_KEY=$(cat "${SSH_KEY}.pub")
echo "Adding SSH key to GitLab..."
curl --header "PRIVATE-TOKEN: ${test_pat}" --data-urlencode "title=${SSH_KEY_COMMENT}" --data-urlencode "key=${PUBLIC_SSH_KEY}" "http://${GITLAB_INSTANCE}:${WEB_PORT}/api/v4/user/keys"
check_exit_code

echo "Forwarding gitlab-shell service"
kubectl port-forward service/${RELEASE_NAME}-gitlab-shell 32022:32022 &
sleep 10

echo "Configuring SSH..."
cat <<EOL >> ~/.ssh/config
Host gitlab-local
  HostName localhost
  User git
  IdentityFile ${SSH_KEY}
  Port ${SSH_PORT}
  StrictHostKeyChecking no
  KexAlgorithms ecdh-sha2-nistp256
  MACs hmac-sha2-256
  Ciphers aes128-ctr
EOL
check_exit_code

echo "Testing SSH connection..."
ssh -T git@gitlab-local
check_exit_code

echo "Cloning GitLab project..."
git clone "ssh://git@gitlab-local:${SSH_PORT}/root/${REPO}.git"
check_exit_code
cd ${REPO}

echo "Creating a new branch..."
branch="${BRANCH}-$(date +%s)"
git checkout -b ${branch}
check_exit_code

echo "Making changes to the branch..."
echo "Hello there" >> README.md
git config user.email "testing@gitlab.com"
git config user.name "Tester"
git add README.md
git commit -m "Lab's open!!"
check_exit_code

git push origin ${branch}
check_exit_code

cd ..

exit 0
