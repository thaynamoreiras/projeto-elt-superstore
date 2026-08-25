-- Dimensão Data

CREATE OR REPLACE TABLE `projetorotaetl.dw_superstore.dim_data` AS
WITH base AS (
  SELECT DISTINCT
    DATE(order_date) AS data_completa,
    year AS ano,
    weeknum AS numero_semana
  FROM `projetorotaetl.super_store.superstore`
)
SELECT
  FORMAT_DATE('%Y%m%d', data_completa) AS id_data,
  data_completa,
  ano,
  numero_semana
FROM base;
