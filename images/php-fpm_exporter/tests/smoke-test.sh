#!/usr/bin/env bash

set -euxo pipefail
# tmpdir
tmpdir=$(mktemp -d)
pushd "${tmpdir}"
cat > prometheus.yml <<EOF
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'php-fpm'
    static_configs:
      - targets: ['php-fpm-exporter:9103']
EOF

cat > docker-compose.yml <<EOF
version: '3'

services:
  php-fpm-exporter:
    image: ${IMAGE_NAME}
    command:
      - --phpfpm.scrape-uri=[http://127.0.0.1:9000/status]  # Update with your PHP-FPM status endpoint
    ports:
      - "9103:9103"
    networks:
      - monitoring

  prometheus:
    image: prom/prometheus:latest
    volumes:
      - "./prometheus.yml:/etc/prometheus/prometheus.yml"
    command:
      - "--config.file=/etc/prometheus/prometheus.yml"
    ports:
      - "9090:9090"
    networks:
      - monitoring

networks:
  monitoring:
    driver: bridge
EOF

docker-compose up -d -t 300

docker-compose logs

PROMETHEUS_URL="http://localhost:9090"
TARGET_NAME="php-fpm"

sleep 5

# Get targets from Prometheus
targets=$(curl -s "${PROMETHEUS_URL}/api/v1/targets" | jq -r ".data.activeTargets[] | select(.labels.job == \"${TARGET_NAME}\")")

# Check if any targets are scraped
if [ -n "$targets" ]; then
    echo "Targets for ${TARGET_NAME} are being scraped:"
    echo "$targets"
else
    echo "No targets found for ${TARGET_NAME}. Check your configuration."
fi


# trap and clean up docker-compose down and use it as function
function cleanup {
    # add the logs output first
    docker-compose down
    rm -rf ${tmpdir}
}

# call cleanup function

trap cleanup EXIT