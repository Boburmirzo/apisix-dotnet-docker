curl "http://127.0.0.1:9080/apisix/admin/upstreams/1" -H "X-API-KEY: edd1c9f034335f136f87ad84b625c8f1" -X PUT -d '
{
 "nodes": {
     "productapi1:80": 1,
     "productapi2:80": 1
 },
 "type": "roundrobin",
 "checks": {
     "active": {
         "type": "http",
         "http_path": "/api/health",
         "healthy": {
             "interval": 2,
             "successes": 1
         },
         "unhealthy": {
             "interval": 1,
             "http_failures": 2
         }
     }
   }
}'