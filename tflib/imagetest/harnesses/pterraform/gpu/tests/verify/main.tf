variable "project" {}

variable "region" {}

variable "zone" {}

variable "instance_name" { type = string }

variable "container_id" { type = string }

resource "terraform_data" "check-gpu" {
  provisioner "local-exec" {
    command = <<EOF
retry_count=0
max_retries=18 # 3 minutes

while [ $retry_count -lt $max_retries ]; do
  if gcloud compute ssh --project '${var.project}' --zone '${var.zone}' --strict-host-key-checking no '${var.instance_name}' --command="docker exec '${var.container_id}' nvidia-smi"; then
    break
  fi
  retry_count=$((retry_count + 1))
  echo "Attempt $retry_count failed. Retrying..."
  sleep 10
done

if [ $retry_count -eq $max_retries ]; then
  echo "Command failed after $max_retries attempts."
  exit 1
fi
    EOF
  }

}
