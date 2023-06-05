curl http://127.0.0.1:9080/apisix/admin/routes/1 -H 'X-API-KEY: edd1c9f034335f136f87ad84b625c8f1' -X PUT -d '
{
    "name": "Route for health check",
    "methods": ["GET"], 
    "uri": "/api/products", 
    "plugins": {},
    "upstream_id": "1"
}'