curl "http://127.0.0.1:9080/apisix/admin/routes/1" -H 'X-API-KEY: edd1c9f034335f136f87ad84b625c8f1' -X PUT -d '
{
    "name": "Route for a circuit breaker",
    "methods": ["GET"],
    "uri": "/api/products",
    "upstream_id": "1",
    "plugins": {
        "api-breaker": {
            "break_response_code": 502,
			      "max_breaker_sec": 30,
            "unhealthy": {
                "http_statuses": [500, 503],
                "failures": 3
            },
            "healthy": {
                "http_statuses": [200],
                "successes": 1
            }
        }
    }
}'