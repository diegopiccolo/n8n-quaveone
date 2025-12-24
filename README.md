# n8n Deployment on Quave Cloud

This project contains the configuration files needed to deploy n8n workflow automation platform on Quave Cloud.

## Prerequisites

1. A Quave Cloud account
2. A GitHub repository (for connecting to Quave Cloud)
3. (Recommended) A PostgreSQL database instance on Quave Cloud

## Quick Start

### Step 1: Create PostgreSQL Database (Recommended)

1. Go to Quave Cloud dashboard → New Project → Database
2. Configure:
   - **Docker preset**: PostgreSQL
   - **Database name**: `n8n-db` (or your preferred name)
   - **Environment name**: `production`
   - **Resources**: Start with 1 zCloud ($7.50/mo) or 2 zClouds ($15.00/mo)
   - **Disk size**: 10 GB (adjust based on your needs)
   - **Replicas**: 1
   - **Region**: Choose your preferred region
3. Click "Create DB"
4. **Save the connection details** (host, database name, user, password)

### Step 2: Create n8n App on Quave Cloud

1. Go to Quave Cloud dashboard → New Project → App
2. Connect your GitHub repository containing this project
3. Configure:
   - **App name**: `n8n`
   - **Docker preset**: `CUSTOM`
   - **Dockerfile path**: `Dockerfile`
   - **Context directory**: `./`
   - **Port**: `5678`
   - **Health check path**: `/healthz` or `/`

### Step 3: Configure Environment Variables

In your Quave Cloud app environment settings, add the following environment variables:

#### Required:
```
N8N_PORT=5678
N8N_PROTOCOL=https
```

#### Database Configuration (if using PostgreSQL):
```
DB_TYPE=postgresdb
DB_POSTGRESDB_HOST=<your-db-host-from-step-1>
DB_POSTGRESDB_PORT=5432
DB_POSTGRESDB_DATABASE=<your-db-name>
DB_POSTGRESDB_USER=<your-db-user>
DB_POSTGRESDB_PASSWORD=<your-db-password>
```

#### Security (Highly Recommended):
```
N8N_ENCRYPTION_KEY=<generate-a-random-32-character-string>
N8N_BASIC_AUTH_ACTIVE=true
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=<your-secure-password>
```

#### Webhook Configuration:
```
WEBHOOK_URL=https://<your-quave-app-url>/
N8N_HOST=<your-quave-app-url>
```

#### Optional:
```
GENERIC_TIMEZONE=UTC
```

**Note**: Replace all `<...>` placeholders with your actual values.

### Step 4: Deploy

1. Commit and push this project to your GitHub repository
2. In Quave Cloud, trigger a build/deployment
3. Wait for deployment to complete (usually 2-3 minutes)

### Step 5: Access n8n

Once deployed, access your n8n instance at:
```
https://<your-quave-app-url>
```

If you enabled basic authentication, use the credentials you set in `N8N_BASIC_AUTH_USER` and `N8N_BASIC_AUTH_PASSWORD`.

## Important Notes

### Data Persistence

- **With PostgreSQL**: Workflows and credentials are stored in the database. This is the recommended approach for production.
- **Without Database**: Data is stored in the container filesystem at `/home/node/.n8n` and will be **lost on redeploy**. Only use this for testing.

### Encryption Key

The `N8N_ENCRYPTION_KEY` is critical:
- Generate a secure random 32-character string
- **Keep it safe** - losing it means losing access to encrypted credentials
- Use the same key across deployments to maintain access to encrypted data

### Security

Always enable basic authentication (`N8N_BASIC_AUTH_ACTIVE=true`) to protect your n8n instance from unauthorized access.

### Webhooks

Make sure to set `WEBHOOK_URL` to your Quave Cloud app URL so n8n can properly receive webhook calls.

## Troubleshooting

### Health Check Failures

If you see 503 errors:
- Verify the port is set to `5678` in Quave Cloud app settings
- Check that the health check path is `/healthz` or `/`
- Review the deployment logs in Quave Cloud

### Database Connection Issues

- Verify all database environment variables are set correctly
- Check that the database instance is running
- Ensure the database host is accessible from your app region

### Can't Access n8n

- Verify `N8N_PROTOCOL=https` is set
- Check that `N8N_HOST` matches your Quave Cloud app URL
- If using basic auth, ensure credentials are correct

## Resources

- [n8n Documentation](https://docs.n8n.io/)
- [n8n Docker Installation Guide](https://docs.n8n.io/hosting/installation/docker/)
- [n8n Environment Variables](https://docs.n8n.io/hosting/configuration/environment-variables/)

## License

n8n is fair-code distributed under the Sustainable Use License. See the [n8n repository](https://github.com/n8n-io/n8n) for details.

