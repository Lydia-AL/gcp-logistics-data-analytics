# Création de l'instance PostgreSQL sur Cloud SQL

L'instance PostgreSQL a été créée avec Google Cloud CLI.

```bash
PROJECT_ID=<your-project-id>

REGION=europe-west9

INSTANCE=pj13-pg

PASSWORD='StrongPassw0rd!'

gcloud config set project $PROJECT_ID

gcloud sql instances create $INSTANCE \
    --database-version=POSTGRES_17 \
    --cpu=2 \
    --memory=4GB \
    --region=$REGION \
    --root-password=$PASSWORD
```

Cette instance Cloud SQL héberge la base de données transactionnelle utilisée dans le projet.
