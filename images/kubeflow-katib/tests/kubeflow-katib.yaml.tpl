---
apiVersion: config.kubeflow.org/v1beta1
kind: KatibConfig
init:
  certGenerator:
    enable: true
  controller:
    webhookPort: 8443
    trialResources:
      - Job.v1.batch
      - TFJob.v1.kubeflow.org
      - PyTorchJob.v1.kubeflow.org
      - MPIJob.v1.kubeflow.org
      - XGBoostJob.v1.kubeflow.org
      - MXJob.v1.kubeflow.org
runtime:
  metricsCollectors:
    - kind: StdOut
      image: ${IMAGE_REPOSITORY_FILE_METRICSCOLLECTOR}:${IMAGE_REPOSITORY_FILE_METRICSCOLLECTOR_TAG}
    - kind: File
      image: ${IMAGE_REPOSITORY_FILE_METRICSCOLLECTOR}:${IMAGE_REPOSITORY_FILE_METRICSCOLLECTOR_TAG}
    - kind: TensorFlowEvent
      image: docker.io/kubeflowkatib/tfevent-metrics-collector:latest
      resources:
        limits:
          memory: 1Gi
  suggestions:
    - algorithmName: random
      image: ${IMAGE_REPOSITORY_SUGGESTION_HYPEROPT}:${IMAGE_REPOSITORY_SUGGESTION_HYPEROPT_TAG}
    - algorithmName: tpe
      image: ${IMAGE_REPOSITORY_SUGGESTION_HYPEROPT}:${IMAGE_REPOSITORY_SUGGESTION_HYPEROPT_TAG}
    - algorithmName: grid
      image: ${IMAGE_REPOSITORY_SUGGESTION_OPTUNA}:${IMAGE_REPOSITORY_SUGGESTION_OPTUNA_TAG}
    - algorithmName: hyperband
      image: ${IMAGE_REPOSITORY_SUGGESTION_HYPERBAND}:${IMAGE_REPOSITORY_SUGGESTION_HYPERBAND_TAG}
    - algorithmName: bayesianoptimization
      image: ${IMAGE_REPOSITORY_SUGGESTION_SKOPT}:${IMAGE_REPOSITORY_SUGGESTION_SKOPT_TAG}
    - algorithmName: cmaes
      image: ${IMAGE_REPOSITORY_SUGGESTION_GOPTUNA}:${IMAGE_REPOSITORY_SUGGESTION_GOPTUNA_TAG}
    - algorithmName: sobol
      image: ${IMAGE_REPOSITORY_SUGGESTION_GOPTUNA}:${IMAGE_REPOSITORY_SUGGESTION_GOPTUNA_TAG}
    - algorithmName: multivariate-tpe
      image: ${IMAGE_REPOSITORY_SUGGESTION_OPTUNA}:${IMAGE_REPOSITORY_SUGGESTION_OPTUNA_TAG}
    - algorithmName: enas
      image: docker.io/kubeflowkatib/suggestion-enas:latest
      resources:
        limits:
          memory: 200Mi
    - algorithmName: darts
      image: ${IMAGE_REPOSITORY_SUGGESTION_NAS_DARTS}:${IMAGE_REPOSITORY_SUGGESTION_NAS_DARTS_TAG}
    - algorithmName: pbt
      image: ${IMAGE_REPOSITORY_SUGGESTION_PBT}:${IMAGE_REPOSITORY_SUGGESTION_PBT_TAG}
      persistentVolumeClaimSpec:
        accessModes:
          - ReadWriteMany
        resources:
          requests:
            storage: 5Gi
  earlyStoppings:
    - algorithmName: medianstop
      image: ${IMAGE_REPOSITORY_EARLYSTOPPING}:${IMAGE_REPOSITORY_EARLYSTOPPING_TAG}
