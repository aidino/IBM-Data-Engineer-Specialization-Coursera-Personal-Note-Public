reference: https://medium.com/event-driven-utopia/making-sense-of-access-logs-with-the-modern-streaming-stack-8d3b8777f697

python apache-fake-log-gen.py -n 0 | tee access-logs/access-logs_$(date +%s).log