-- Dimensão Cliente

CREATE OR REPLACE TABLE `projetorotaetl.dw_superstore.dim_cliente` AS
SELECT DISTINCT
  customer_id AS id_cliente,
  customer_name AS nome_cliente,
  segment AS segmento
FROM `projetorotaetl.super_store.superstore`;
