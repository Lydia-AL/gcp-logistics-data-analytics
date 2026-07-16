CREATE OR REPLACE VIEW
  `YOUR_PROJECT_ID.dataset_jour13.v_delays` AS

SELECT
  ship.shipment_id,
  ship.departure_time,
  ship.actual_duration_hr,
  route.avg_expected_duration_hr,
  route.origin_city,
  route.destination_city,
  ship.actual_duration_hr - route.avg_expected_duration_hr AS delay_hours
FROM `YOUR_PROJECT_ID.dataset_jour13.shipments` AS ship
JOIN `YOUR_PROJECT_ID.dataset_jour13.route_reference` AS route
  ON ship.route_id = route.route_id;
