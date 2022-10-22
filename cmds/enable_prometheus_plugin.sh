curl http://127.0.0.1:9080/apisix/admin/routes/1  -H 'X-API-KEY: edd1c9f034335f136f87ad84b625c8f1' -X PUT -d '
{
    "uri": "/api/products",
    "plugins": {
        "prometheus":{}
    },
    "upstream_id": "1"
}'

# See metrics
curl -i http://127.0.0.1:9091/apisix/prometheus/metrics

# And we can also check the status of our endpoint at
# Prometheus dashboard by pointing to this URL http://localhost:9090/targets

# In addition to this, you can view Grafana dashboard running in your local instance.
# Go to http://localhost:3000/

