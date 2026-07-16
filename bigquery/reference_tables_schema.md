# Reference datasets

The reference CSV files were uploaded to Google Cloud Storage and loaded into BigQuery.

## route_reference

| Column | BigQuery type |
|---|---|
| route_id | INTEGER |
| origin_city | STRING |
| destination_city | STRING |
| standard_distance_km | FLOAT |
| avg_expected_duration_hr | FLOAT |

## vehicle_specs

| Column | BigQuery type |
|---|---|
| vehicle_id | INTEGER |
| vehicle_type | STRING |
| fuel_type | STRING |
| fuel_efficiency_km_per_litre | FLOAT |
| capacity_tonnes | FLOAT |

## city_weather_zones

| Column | BigQuery type |
|---|---|
| city_name | STRING |
| climate_zone | STRING |
| avg_rain_days_per_year | INTEGER |
| avg_temp_c | FLOAT |

## fuel_prices_monthly

| Column | BigQuery type |
|---|---|
| month | DATE |
| diesel_eur_per_l | FLOAT |
| electric_eur_per_kwh | FLOAT |
| hydrogen_eur_per_kg | FLOAT |

## Source files

- `route_reference.csv`
- `vehicle_specs.csv`
- `city_weather_zones.csv`
- `fuel_prices_monthly.csv`

The original training datasets are not included in this repository.
