curl -i http://127.0.0.1:9080/apisix/admin/routes/1 -H 'X-API-KEY: edd1c9f034335f136f87ad84b625c8f1' -X PUT -d '
{
    "name": "A route with the limit count plugin",
    "methods": ["GET"],
    "uri": "/api/products",
    "plugins": {
        "limit-count": {
            "count": 2,
            "time_window": 60,
            "rejected_code": 403,
            "rejected_msg": "Requests are too frequent, please try again later.",
            "key_type": "var",
            "key": "remote_addr"
        }
    },
    "upstream_id": "1"
}'
