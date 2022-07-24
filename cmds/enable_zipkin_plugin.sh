curl http://127.0.0.1:9080/apisix/admin/routes/1  -H 'X-API-KEY: edd1c9f034335f136f87ad84b625c8f1' -X PUT -d '
{
    "name": "Route with zipkin plugin enabled",
    "methods": ["GET"],
    "uri": "/api/products",
    "plugins": {
        "zipkin": {
            "endpoint": "http://127.0.0.1:9411/api/v2/spans",
            "sample_ratio": 1
        }
    },
    "upstream_id": "1"
}'


## We can send a request to this get endpoint to generate traces.

curl  http://127.0.0.1:9080/api/products -i

curl http://127.0.0.1:9411/zipkin/?serviceName=APISIX
