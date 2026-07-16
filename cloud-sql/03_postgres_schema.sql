-- PostgreSQL schema for operational logistics data stored in Cloud SQL.

CREATE TABLE IF NOT EXISTS drivers (
  driver_id BIGINT PRIMARY KEY,
  driver_name TEXT NOT NULL,
  hire_date DATE NOT NULL,
  home_depot_city TEXT
);

CREATE TABLE IF NOT EXISTS vehicles_status (
  vehicle_id BIGINT PRIMARY KEY,
  in_service BOOLEAN,
  odometer_km BIGINT,
  assigned_depot_city TEXT
);

CREATE TABLE IF NOT EXISTS shipments (
  shipment_id BIGINT PRIMARY KEY,
  route_id BIGINT NOT NULL,
  vehicle_id BIGINT REFERENCES vehicles_status(vehicle_id),
  driver_id BIGINT REFERENCES drivers(driver_id),
  departure_time TIMESTAMP NOT NULL,
  arrival_time TIMESTAMP NOT NULL,
  cargo_weight_tonnes NUMERIC(10,2),
  distance_km NUMERIC(10,1),
  actual_duration_hr NUMERIC(10,2),
  fuel_consumed_litres NUMERIC(12,2),
  energy_used_kwh NUMERIC(12,1),
  hydrogen_used_kg NUMERIC(12,2),
  incidents_reported INT
);

CREATE TABLE IF NOT EXISTS vehicle_maintenance (
  vehicle_id BIGINT REFERENCES vehicles_status(vehicle_id),
  maintenance_date DATE NOT NULL,
  type TEXT NOT NULL,
  cost_usd NUMERIC(12,2),
  downtime_days INT
);

CREATE TABLE IF NOT EXISTS driver_logs (
  driver_id BIGINT REFERENCES drivers(driver_id),
  shift_date DATE NOT NULL,
  hours_driven NUMERIC(6,2),
  incidents_reported INT
);
