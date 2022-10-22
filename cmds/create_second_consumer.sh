curl http://127.0.0.1:9080/apisix/admin/consumers -H 'X-API-KEY: edd1c9f034335f136f87ad84b625c8f1' -X PUT -i -d '
{
    "username": "consumer2",
    "plugins": {
        "basic-auth": {
            "username":"consumer2",
            "password": "654321"
        }
    }
}'
