curl http://127.0.0.1:9080/apisix/admin/routes/1 \
-H 'X-API-KEY: edd1c9f034335f136f87ad84b625c8f1' -X PUT -d '
{
  "name": "Route for Fault Injection with the abort",
  "methods": [
    "GET"
  ],
  "uri": "/api/products",
  "plugins": {
    "fault-injection": {
      "abort": {
        "http_status": 503,
        "body": "The product service is currently unavailable.",
        "percentage": 100
      }
    }
  },
  "upstream": {
    "type": "roundrobin",
    "nodes": {
      "productapi:80": 1
    }
  }
}'