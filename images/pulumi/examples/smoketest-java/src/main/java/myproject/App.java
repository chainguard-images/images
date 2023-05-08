package myproject;

import com.pulumi.Pulumi;
import com.pulumi.kubernetes.core.v1.Pod;
import com.pulumi.kubernetes.core.v1.PodArgs;
import com.pulumi.kubernetes.core.v1.inputs.PodSpecArgs;
import com.pulumi.kubernetes.core.v1.inputs.ContainerArgs;
import com.pulumi.kubernetes.core.v1.inputs.ContainerPortArgs;
import com.pulumi.kubernetes.meta.v1.inputs.ObjectMetaArgs;

public class App {
    public static void main(String[] args) {
        Pulumi.run(ctx -> {
            var config = ctx.config();
            var name = config.require("name");
            var image = config.require("image");
            var pod = new Pod("nginx", PodArgs.builder()
                .metadata(ObjectMetaArgs.builder()
                    .name(name)
                    .build())
                .spec(PodSpecArgs.builder()
                    .containers(ContainerArgs.builder()
                        .name(name)
                        .image(image)
                        .ports(ContainerPortArgs.builder()
                            .containerPort(8080)
                            .build())
                        .build())
                    .build())
                .build());
        });
    }
}
