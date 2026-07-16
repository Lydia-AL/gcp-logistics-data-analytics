# Create the PostgreSQL database and user

## Environment variables

```bash
INSTANCE="pj13-pg"
DB="logistics"
USER="YOUR_DATABASE_USER"
```

## Create the database

```bash
gcloud sql databases create "$DB" \
  --instance="$INSTANCE"
```

## Create the database user

```bash
gcloud sql users create "$USER" \
  --instance="$INSTANCE" \
  --password="YOUR_SECURE_PASSWORD"
```

The database used in this project was named `logistics`.

Real usernames and passwords are not included in this repository.
