curl http://127.0.0.1:9080/apisix/admin/plugin_configs/1 -H "X-API-KEY: edd1c9f034335f136f87ad84b625c8f1" -X PATCH -d ' 
{
   "plugins":{
      "zipkin":{
            "endpoint": "http://127.0.0.1:9411/api/v2/spans",
            "sample_ratio": 1,
            "service_name": "APISIX",
            "server_addr": "host.docker.internal"
      }
   }
}'

## We can send a request to this get endpoint to generate traces.

curl -i http://127.0.0.1:9080/api/products

curl http://127.0.0.1:9411/zipkin/?serviceName=APISIX
