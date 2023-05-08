import pulumi
import pulumi_kubernetes as kubernetes

config = pulumi.Config()
name = config.get("name")
image = config.get("image")

pod = kubernetes.core.v1.Pod(
    name,
    metadata=kubernetes.meta.v1.ObjectMetaArgs(
        name=name,
    ),
    spec=kubernetes.core.v1.PodSpecArgs(
    containers=[kubernetes.core.v1.ContainerArgs(
        image=image,
        name=name,
        ports=[kubernetes.core.v1.ContainerPortArgs(
            container_port=8080,
        )],
    )],
))
