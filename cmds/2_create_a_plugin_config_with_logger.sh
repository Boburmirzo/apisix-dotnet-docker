curl http://127.0.0.1:9080/apisix/admin/plugin_configs/1 -H "X-API-KEY: edd1c9f034335f136f87ad84b625c8f1" -X PUT -d ' 
{
   "plugins":{
      "http-logger":{
         "uri":"http://mockbin.org/bin/305d0edc-de7d-4386-bdc7-bf34a3133701"
      }
   }
}'

## We can send a request to this get endpoint to generate logs.

curl -i -XGET http://127.0.0.1:9080/api/products

## Next, access your mock server logs and check logs
## https://mockbin.org/bin/305d0edc-de7d-4386-bdc7-bf34a3133701/log