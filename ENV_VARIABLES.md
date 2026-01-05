# Environment Variables Configuration

This is a **template** file. Your actual values are stored in `.env` (which is gitignored).

Copy the environment variables from `.env` to your Quave Cloud app settings.

## Required Variables

```
N8N_PORT=5678
N8N_PROTOCOL=https
```

## Database Configuration (PostgreSQL - Recommended)

Get these values from your Quave Cloud database instance:

```
DB_TYPE=postgresdb
DB_POSTGRESDB_HOST=<your-db-host>
DB_POSTGRESDB_PORT=5432
DB_POSTGRESDB_DATABASE=<your-db-name>
DB_POSTGRESDB_USER=<your-db-user>
DB_POSTGRESDB_PASSWORD=<your-db-password>
```

## Security (Highly Recommended)

Generate a random 32-character string for the encryption key:

```
N8N_ENCRYPTION_KEY=<generate-a-random-32-character-string>
N8N_BASIC_AUTH_ACTIVE=true
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=<your-secure-password>
```

## Webhook Configuration

Replace `<your-quave-app-url>` with your actual Quave Cloud app URL:

```
WEBHOOK_URL=https://<your-quave-app-url>/
N8N_HOST=<your-quave-app-url>
```

## Optional Settings

```
GENERIC_TIMEZONE=UTC
```

## Notes

- Replace all `<...>` placeholders with your actual values
- The encryption key should be a secure random 32-character string
- Keep the encryption key safe - losing it means losing access to encrypted credentials
- Use the same encryption key across deployments to maintain access to encrypted data

