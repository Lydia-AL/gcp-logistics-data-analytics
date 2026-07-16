-- Materialize PostgreSQL tables in BigQuery using a Cloud SQL
-- federated connection.
--
-- Replace:
-- YOUR_PROJECT_ID
-- YOUR_CONNECTION_ID
-- with the identifiers from your own Google Cloud environment.

CREATE OR REPLACE TABLE
  `YOUR_PROJECT_ID.dataset_jour13.drivers` AS
SELECT *
FROM EXTERNAL_QUERY(
  'YOUR_PROJECT_ID.europe-west9.YOUR_CONNECTION_ID',
  'SELECT * FROM public.drivers'
);


CREATE OR REPLACE TABLE
  `YOUR_PROJECT_ID.dataset_jour13.vehicles_status` AS
SELECT *
FROM EXTERNAL_QUERY(
  'YOUR_PROJECT_ID.europe-west9.YOUR_CONNECTION_ID',
  'SELECT * FROM public.vehicles_status'
);


CREATE OR REPLACE TABLE
  `YOUR_PROJECT_ID.dataset_jour13.shipments` AS
SELECT *
FROM EXTERNAL_QUERY(
  'YOUR_PROJECT_ID.europe-west9.YOUR_CONNECTION_ID',
  'SELECT * FROM public.shipments'
);


CREATE OR REPLACE TABLE
  `YOUR_PROJECT_ID.dataset_jour13.vehicle_maintenance` AS
SELECT *
FROM EXTERNAL_QUERY(
  'YOUR_PROJECT_ID.europe-west9.YOUR_CONNECTION_ID',
  'SELECT * FROM public.vehicle_maintenance'
);


CREATE OR REPLACE TABLE
  `YOUR_PROJECT_ID.dataset_jour13.driver_logs` AS
SELECT *
FROM EXTERNAL_QUERY(
  'YOUR_PROJECT_ID.europe-west9.YOUR_CONNECTION_ID',
  'SELECT * FROM public.driver_logs'
);
