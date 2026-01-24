FROM docker.n8n.io/n8nio/n8n:2.4.4

# n8n stable version 2.4.4 (updated 2026-01-24)
# https://docs.n8n.io/hosting/installation/docker/#updating

# n8n will use /home/node/.n8n for data storage
# This is handled by the base image

EXPOSE 5678

# The base image already has the correct CMD to start n8n

