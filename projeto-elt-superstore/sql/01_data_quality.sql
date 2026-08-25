-- Projeto ELT — Super Store
-- Data Quality: nulos, duplicidades, categóricas e métricas
-- Projeto/dataset conforme documentação original.

-- 1. Visão geral de nulos
SELECT
  COUNT(*) AS total_linhas,
  COUNT(customer_id) AS customer_id_preenchidos,
  COUNT(product_id) AS product_id_preenchidos,
  COUNT(ship_mode) AS ship_mode_preenchidos
FROM `projetorotaetl.super_store.superstore`;

-- 2. Nulos por coluna
SELECT
  SUM(CASE WHEN row_id IS NULL THEN 1 ELSE 0 END) AS null_row_id,
  SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_order_id,
  SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customer_id,
  SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS null_product_id,
  SUM(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END) AS null_order_date,
  SUM(CASE WHEN ship_date IS NULL THEN 1 ELSE 0 END) AS null_ship_date,
  SUM(CASE WHEN year IS NULL THEN 1 ELSE 0 END) AS null_year,
  SUM(CASE WHEN weeknum IS NULL THEN 1 ELSE 0 END) AS null_weeknum,
  SUM(CASE WHEN customer_name IS NULL THEN 1 ELSE 0 END) AS null_customer_name,
  SUM(CASE WHEN segment IS NULL THEN 1 ELSE 0 END) AS null_segment,
  SUM(CASE WHEN product_name IS NULL THEN 1 ELSE 0 END) AS null_product_name,
  SUM(CASE WHEN category IS NULL THEN 1 ELSE 0 END) AS null_category,
  SUM(CASE WHEN sub_category IS NULL THEN 1 ELSE 0 END) AS null_sub_category,
  SUM(CASE WHEN city IS NULL THEN 1 ELSE 0 END) AS null_city,
  SUM(CASE WHEN state IS NULL THEN 1 ELSE 0 END) AS null_state,
  SUM(CASE WHEN region IS NULL THEN 1 ELSE 0 END) AS null_region,
  SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) AS null_country,
  SUM(CASE WHEN market IS NULL THEN 1 ELSE 0 END) AS null_market,
  SUM(CASE WHEN market2 IS NULL THEN 1 ELSE 0 END) AS null_market2,
  SUM(CASE WHEN ship_mode IS NULL THEN 1 ELSE 0 END) AS null_ship_mode,
  SUM(CASE WHEN order_priority IS NULL THEN 1 ELSE 0 END) AS null_order_priority,
  SUM(CASE WHEN shipping_cost IS NULL THEN 1 ELSE 0 END) AS null_shipping_cost,
  SUM(CASE WHEN sales IS NULL THEN 1 ELSE 0 END) AS null_sales,
  SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS null_quantity,
  SUM(CASE WHEN discount IS NULL THEN 1 ELSE 0 END) AS null_discount,
  SUM(CASE WHEN profit IS NULL THEN 1 ELSE 0 END) AS null_profit,
  SUM(CASE WHEN unknown IS NULL THEN 1 ELSE 0 END) AS null_unknown
FROM `projetorotaetl.super_store.superstore`;

-- 3. Duplicidade por row_id
SELECT
  row_id,
  COUNT(*) AS qtd_registros
FROM `projetorotaetl.super_store.superstore`
GROUP BY row_id
HAVING COUNT(*) > 1;

-- 4. Duplicidade por pedido + produto
SELECT
  order_id,
  product_id,
  COUNT(*) AS qtd_registros
FROM `projetorotaetl.super_store.superstore`
GROUP BY order_id, product_id
HAVING COUNT(*) > 1;

-- 5. Integridade da dimensão cliente
SELECT
  customer_id,
  COUNT(DISTINCT customer_name) AS qtd_nomes
FROM `projetorotaetl.super_store.superstore`
GROUP BY customer_id
HAVING COUNT(DISTINCT customer_name) > 1;

-- 6. Integridade da dimensão produto
SELECT
  product_id,
  COUNT(DISTINCT product_name) AS qtd_descricoes
FROM `projetorotaetl.super_store.superstore`
GROUP BY product_id
HAVING COUNT(DISTINCT product_name) > 1;

-- 7. Distribuição por data
SELECT
  order_date,
  COUNT(*) AS qtd_registros
FROM `projetorotaetl.super_store.superstore`
GROUP BY order_date
ORDER BY qtd_registros DESC;

-- 8. Variáveis categóricas
SELECT DISTINCT segment
FROM `projetorotaetl.super_store.superstore`;

SELECT DISTINCT category
FROM `projetorotaetl.super_store.superstore`;

SELECT DISTINCT sub_category
FROM `projetorotaetl.super_store.superstore`;

SELECT DISTINCT ship_mode
FROM `projetorotaetl.super_store.superstore`;

SELECT DISTINCT region, country
FROM `projetorotaetl.super_store.superstore`;

-- 9. Variáveis numéricas
SELECT
  MIN(sales) AS min_sales,
  MAX(sales) AS max_sales,
  COUNT(*) AS total_registros,
  COUNTIF(sales IS NULL) AS null_sales
FROM `projetorotaetl.super_store.superstore`;

SELECT
  MIN(profit) AS min_profit,
  MAX(profit) AS max_profit,
  COUNTIF(profit IS NULL) AS null_profit
FROM `projetorotaetl.super_store.superstore`;

SELECT
  MIN(quantity) AS min_quantity,
  MAX(quantity) AS max_quantity,
  COUNTIF(quantity IS NULL) AS null_quantity
FROM `projetorotaetl.super_store.superstore`;

SELECT
  MIN(discount) AS min_discount,
  MAX(discount) AS max_discount,
  COUNTIF(discount IS NULL) AS null_discount
FROM `projetorotaetl.super_store.superstore`;
