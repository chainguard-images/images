using System.Collections.Generic;
using System.Threading.Tasks;
using Pulumi;
using Kubernetes = Pulumi.Kubernetes;

return await Deployment.RunAsync(() =>
{
    {
        var config = new Pulumi.Config();
        var name = config.Require("name");
        var image = config.Require("image");
        var pod = new Kubernetes.Core.V1.Pod("pod", new Kubernetes.Types.Inputs.Core.V1.PodArgs
        {
            Metadata = new Kubernetes.Types.Inputs.Meta.V1.ObjectMetaArgs
            {
                Name = name,
            },
            Spec = new Kubernetes.Types.Inputs.Core.V1.PodSpecArgs
            {
                Containers = 
                {
                    new Kubernetes.Types.Inputs.Core.V1.ContainerArgs
                    {
                        Image = image,
                        Name = name,
                        Ports = 
                        {
                            new Kubernetes.Types.Inputs.Core.V1.ContainerPortArgs
                            {
                                ContainerPortValue = 8080,
                            },
                        },
                    },
                },
            },
        });
    }

});
