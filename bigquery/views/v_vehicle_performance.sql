CREATE OR REPLACE VIEW
  `YOUR_PROJECT_ID.dataset_jour13.v_vehicle_performance` AS

WITH base AS (
  SELECT
    ship.shipment_id,
    ship.vehicle_id,
    ship.route_id,
    ship.actual_duration_hr,
    ship.distance_km,
    route.avg_expected_duration_hr
  FROM `YOUR_PROJECT_ID.dataset_jour13.shipments` AS ship
  JOIN `YOUR_PROJECT_ID.dataset_jour13.route_reference` AS route
    ON ship.route_id = route.route_id
)

SELECT
  vehicle.vehicle_type,
  vehicle.fuel_type,

  COUNT(*) AS trips,

  AVG(
    base.actual_duration_hr - base.avg_expected_duration_hr
  ) AS avg_delay_hr,

  SAFE_DIVIDE(
    SUM(base.actual_duration_hr - base.avg_expected_duration_hr),
    COUNT(*)
  ) AS delay_per_trip,

  AVG(
    CASE
      WHEN base.actual_duration_hr <= base.avg_expected_duration_hr
      THEN 1
      ELSE 0
    END
  ) * 100 AS pct_on_time,

  SAFE_DIVIDE(
    SUM(base.distance_km),
    SUM(base.actual_duration_hr)
  ) AS avg_speed_kmh

FROM base
JOIN `YOUR_PROJECT_ID.dataset_jour13.vehicle_specs` AS vehicle
  ON base.vehicle_id = vehicle.vehicle_id

GROUP BY
  vehicle.vehicle_type,
  vehicle.fuel_type

ORDER BY avg_delay_hr ASC;
