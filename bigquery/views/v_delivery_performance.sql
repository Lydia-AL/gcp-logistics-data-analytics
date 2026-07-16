CREATE OR REPLACE VIEW
  `YOUR_PROJECT_ID.dataset_jour13.v_delivery_performance` AS

WITH shipments_enriched AS (
  SELECT
    ship.shipment_id,
    ship.route_id,
    ship.departure_time,
    ship.arrival_time,
    ship.actual_duration_hr,
    route.avg_expected_duration_hr,
    route.origin_city,
    route.destination_city,
    weather.climate_zone
  FROM `YOUR_PROJECT_ID.dataset_jour13.shipments` AS ship
  JOIN `YOUR_PROJECT_ID.dataset_jour13.route_reference` AS route
    USING (route_id)
  JOIN `YOUR_PROJECT_ID.dataset_jour13.city_weather_zones` AS weather
    ON weather.city_name = route.destination_city
)

SELECT
  destination_city,
  climate_zone,
  COUNT(*) AS trips,
  ROUND(
    AVG(actual_duration_hr - avg_expected_duration_hr),
    2
  ) AS avg_delay_hr,
  ROUND(
    100 * AVG(
      CASE
        WHEN actual_duration_hr <= avg_expected_duration_hr THEN 1
        ELSE 0
      END
    ),
    1
  ) AS pct_on_time
FROM shipments_enriched
GROUP BY
  destination_city,
  climate_zone
ORDER BY avg_delay_hr DESC;
