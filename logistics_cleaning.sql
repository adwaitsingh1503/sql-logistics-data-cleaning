WITH cleaned_data AS (
  SELECT 
    shipment_id,
    INITCAP(TRIM(origin_warehouse)) AS origin_warehouse,
    COALESCE(INITCAP(TRIM(destination_city)), 'Unknown') AS destination_city,
    UPPER(TRIM(destination_state)) AS destination_state,
    INITCAP(TRIM(carrier)) AS carrier,
    CASE 
      WHEN damage_reported = 'NULL' THEN NULL 
      ELSE INITCAP(TRIM(damage_reported)) 
    END AS damage_reported,
    COALESCE(delivery_date, 'Not Yet Delivered') AS delivery_date,
    ship_date,
    weight_kg,
    CASE
      WHEN weight_kg < 0 THEN ABS(weight_kg)
      WHEN weight_kg = 0 THEN NULL
      ELSE weight_kg
    END AS weight_kg_cleaned,
    freight_cost
  FROM `sql-project-499706.sql_practice.dirty_shipment`
),
ranked_data AS (
  SELECT 
    *,
    ROW_NUMBER() OVER (
      PARTITION BY  origin_warehouse, destination_city, carrier,  ship_date, CAST(weight_kg AS STRING), CAST(freight_cost AS STRING)
      ORDER BY shipment_id
    ) AS row_num
  FROM cleaned_data
)
SELECT * EXCEPT(row_num)
FROM ranked_data
WHERE row_num = 1;





 


