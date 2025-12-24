FROM docker.n8n.io/n8nio/n8n:latest

# n8n will use /home/node/.n8n for data storage
# This is handled by the base image

EXPOSE 5678

# The base image already has the correct CMD to start n8n

