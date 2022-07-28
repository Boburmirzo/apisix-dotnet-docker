# Manage .NET Microservices APIs with Apache APISIX API Gateway

This is an example project focus on the usage of [**Apache APISIX API Gateway**](https://apisix.apache.org/) 
for applications developed in **[ASP.NET Core](https://docs.microsoft.com/en-us/aspnet/core/?view=aspnetcore-6.0)** (Assume that you have an API that manage products) 
and provide an easy example of how to deploy a multiple images using [docker compose](https://docs.docker.com/compose/).

👉 To execute and customize the example project per your need shown in this post, here are the minimum requirements you need to install in your system:

- ➡️ [.NET 6 SDK](https://dotnet.microsoft.com/en-us/download)
- ➡️ [Visual Studio 2022](https://visualstudio.microsoft.com/downloads/) with the Web Development, and/or .NET cross-platform development workload installed. This includes by default .NET 6 development tools. Or [Visual Studio code](https://code.visualstudio.com/). 
- ➡️ [Docker Desktop](https://docs.docker.com/desktop/windows/install/) - you need also [Docker desktop](https://www.docker.com/products/docker-desktop/) installed locally to complete this tutorial. It is available for [Windows](https://desktop.docker.com/win/edge/Docker%20Desktop%20Installer.exe) or [macOS](https://desktop.docker.com/mac/edge/Docker.dmg). 
Or install the [Docker ACI Integration CLI for Linux](https://docs.docker.com/engine/context/aci-integration/#install-the-docker-aci-integration-cli-on-linux).

## Build a multi-container APISIX via Docker CLI

You can start the application by running `docker compose` command from the root folder of the project:

``` bash
docker-compose -p docker-apisix up -d
```

Sample output:

``` bash
[+] Running 7/7
 - Network apisix-dotnet-docker_apisix                Created                                                              0.0s
 - Container apisix-dotnet-docker-apisix-dashboard-1  Started                                                              1.2s
 - Container apisix-dotnet-docker-prometheus-1        Started                                                              0.7s
 - Container apisix-dotnet-docker-etcd-1              Started                                                              0.9s
 - Container apisix-dotnet-docker-grafana-1           Started                                                              1.2s
 - Container apisix-dotnet-docker-productapi-1        Started                                                              0.7s
 - Container apisix-dotnet-docker-apisix-1            Started                                                              2.0s
```

The running container list you can see by running `docker compose ps` CLI command or using docker desktop:


``` bash
NAME                                      COMMAND                  SERVICE             STATUS              PORTS
apisix-dotnet-docker-apisix-1             "sh -c '/usr/bin/api…"   apisix              running             0.0.0.0:9080->9080/tcp, 0.0.0.0:9091-9092->9091-9092/tcp, 0.0.0.0:9443->9443/tcp
apisix-dotnet-docker-apisix-dashboard-1   "/usr/local/apisix-d…"   apisix-dashboard    running             0.0.0.0:9000->9000/tcp
apisix-dotnet-docker-etcd-1               "/opt/bitnami/script…"   etcd                running             0.0.0.0:12379->2379/tcp
apisix-dotnet-docker-grafana-1            "/run.sh"                grafana             running             0.0.0.0:3000->3000/tcp
apisix-dotnet-docker-productapi-1         "dotnet ProductApi.d…"   productapi          running             0.0.0.0:5555->80/tcp
apisix-dotnet-docker-prometheus-1         "/bin/prometheus --c…"   prometheus          running             0.0.0.0:9090->9090/tcp
```
Once the containers are running, navigate to `http://localhost:5555/api/products` in your web browser and you will see the following output:

![Product list .NET API response](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/arxo86mr9emolgfl25ut.png)

You can read the blog post for more information on how to configure APISIX API Gateway for the ASP.NET API.

- Hashnode:
https://boburadvocate.hashnode.dev/manage-net-microservices-apis-with-apache-apisix-api-gateway

- DevTo
https://dev.to/apisix/manage-net-microservices-apis-with-apache-apisix-api-gateway-2cbk

- Medium
https://medium.com/@ApacheAPISIX/manage-net-microservices-apis-with-apache-apisix-api-gateway-13e85853876f
