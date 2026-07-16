CREATE OR REPLACE VIEW
  `YOUR_PROJECT_ID.dataset_jour13.v_delay_by_climate` AS

WITH base AS (
  SELECT
    ship.shipment_id,
    ship.actual_duration_hr,
    route.avg_expected_duration_hr,
    route.destination_city,
    weather.climate_zone
  FROM `YOUR_PROJECT_ID.dataset_jour13.shipments` AS ship
  JOIN `YOUR_PROJECT_ID.dataset_jour13.route_reference` AS route
    ON ship.route_id = route.route_id
  JOIN `YOUR_PROJECT_ID.dataset_jour13.city_weather_zones` AS weather
    ON route.destination_city = weather.city_name
)

SELECT
  climate_zone,
  COUNT(*) AS trips,
  AVG(actual_duration_hr - avg_expected_duration_hr) AS avg_delay_hr,
  AVG(
    CASE
      WHEN actual_duration_hr <= avg_expected_duration_hr THEN 1
      ELSE 0
    END
  ) * 100 AS pct_on_time
FROM base
GROUP BY climate_zone
ORDER BY avg_delay_hr DESC;
