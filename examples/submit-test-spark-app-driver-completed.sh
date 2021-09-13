#!/usr/bin/env bash

# submit-test-spark-app <app-id> <executor-count> <driver-cpu> <driver-mem> <executor-cpu> <executor-mem>
set -o errexit
set -o nounset
set -o pipefail

APP_ID=$1
EXECUTOR_COUNT=$2
DRIVER_CPU=$3
DRIVER_MEM=$4
EXECUTOR_CPU=$5
EXECUTOR_MEM=$6

kubectl create -f <(cat << EOF
apiVersion: v1
kind: Pod
metadata:
  name: test-driver-$APP_ID
  namespace: spark
  labels:
    spark-role: "driver"
    spark-app-id: "$APP_ID"
  annotations:
    spark-driver-cpu: "$DRIVER_CPU"
    spark-driver-mem: "$DRIVER_MEM"
    spark-executor-cpu: "$EXECUTOR_CPU"
    spark-executor-mem: "$EXECUTOR_MEM"
    spark-executor-count: "$EXECUTOR_COUNT"
spec:
  schedulerName: spark-scheduler
  restartPolicy: Never
  nodeSelector:
    "kubernetes.io/os": "linux"
  containers:
  - name: nginx
    image: busybox
    command: ['sh','-c','for i in `seq 1 5`; do sleep 2s; done']
    ports:
    - containerPort: 80
    resources:
      requests:
        cpu: "$DRIVER_CPU"
        memory: "$DRIVER_MEM"
EOF)





