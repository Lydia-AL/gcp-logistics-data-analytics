# Import operational CSV files into Cloud SQL

The operational CSV files were imported through the Cloud SQL Studio interface.

## Imported files

- `drivers.csv`
- `vehicles_status.csv`
- `shipments.csv`
- `vehicle_maintenance.csv`
- `driver_logs.csv`

## Import process

1. Create the PostgreSQL tables using `03_postgres_schema.sql`.
2. Open the Cloud SQL instance in Google Cloud Console.
3. Select **Import data**.
4. Select the CSV file from the local computer.
5. Upload the file to a Cloud Storage bucket when requested.
6. Select the `logistics` database.
7. Select the corresponding destination table.
8. Start the import.
9. Repeat the operation for every operational dataset.

The original datasets are not included in this repository.
