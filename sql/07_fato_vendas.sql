-- Tabela Fato Vendas
-- A fato contém IDs/chaves e métricas, sem atributos descritivos das dimensões.

CREATE OR REPLACE TABLE `projetorotaetl.dw_superstore.fato_vendas` AS
WITH base AS (
  SELECT
    row_id,
    order_id AS id_pedido,
    DATE(order_date) AS data_completa,
    customer_id AS id_cliente,
    product_id AS id_produto,
    country AS pais,
    state AS estado,
    city AS cidade,
    region AS regiao,
    market AS mercado,
    ship_mode AS modo_envio,
    order_priority AS prioridade_pedido,
    sales AS vendas,
    profit AS lucro,
    quantity AS quantidade,
    discount AS desconto,
    shipping_cost AS custo_envio
  FROM `projetorotaetl.super_store.superstore`
)
SELECT
  CAST(row_id AS STRING) AS id_venda,
  id_pedido,
  FORMAT_DATE('%Y%m%d', data_completa) AS id_data,
  id_cliente,
  id_produto,
  TO_HEX(MD5(CONCAT(pais, '|', estado, '|', cidade, '|', regiao, '|', mercado))) AS id_localizacao,
  TO_HEX(MD5(CONCAT(modo_envio, '|', prioridade_pedido))) AS id_envio,
  vendas,
  lucro,
  quantidade,
  desconto,
  custo_envio
FROM base;
