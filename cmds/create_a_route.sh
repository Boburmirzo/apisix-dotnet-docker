curl "http://127.0.0.1:9080/apisix/admin/routes/1" -H "X-API-KEY: edd1c9f034335f136f87ad84b625c8f1" -X PUT -d '    
{
  "name": "Route without any plugin enabled",
  "methods": ["GET"],                                       
  "uri": "/api/products",                   
  "upstream_id": "1"
}'

# Once we have created the Route and upstream, 
# we can check whether it works. 
# Apache APISIX should forward the request to our target API /api/products.

curl http://127.0.0.1:9080/api/products -i 