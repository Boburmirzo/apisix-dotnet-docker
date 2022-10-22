#It is obvious that consumer1 can request the endpoint because we whitelisted the consumer
# in the consumer-restriction plugin config.
curl -u consumer1:123456 http://127.0.0.1:9080/api/products -i

#However, our the second consumer has no access.
# Now we can try to request the same path with different consumer credentials:
curl -u consumer2:123456 http://127.0.0.1:9080/api/products -i
