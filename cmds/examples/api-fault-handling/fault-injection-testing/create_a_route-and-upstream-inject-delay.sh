curl http://127.0.0.1:9080/apisix/admin/routes/1 \
-H 'X-API-KEY: edd1c9f034335f136f87ad84b625c8f1' -X PUT -d '
{
  "name": "Route for Fault Injection with the delay",
  "methods": [
    "GET"
  ],
  "uri": "/api/products",
  "plugins": {
    "fault-injection": {
      "delay": {
        "duration": 5,
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