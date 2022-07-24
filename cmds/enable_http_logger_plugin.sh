curl http://127.0.0.1:9080/apisix/admin/routes/1  -H 'X-API-KEY: edd1c9f034335f136f87ad84b625c8f1' -X PUT -d '
{
    "name": "Route with http-logger plugin enabled",
    "methods": ["GET"],
    "uri": "/api/products",
    "plugins": {
          "http-logger": {
              "uri": "http://mockbin.org/bin/5451b7cd-af27-41b8-8df1-282ffea13a61"
          }
     },
    "upstream_id": "1"
}'

## We can send a request to this get endpoint to generate logs.

curl -i -XGET http://127.0.0.1:9080/api/products

## Next, access your mock server logs and check logs
## https://mockbin.org/bin/5451b7cd-af27-41b8-8df1-282ffea13a61/log

