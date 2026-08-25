-- Dimensão Envio
-- Como ship_mode não possui ID próprio, o projeto gera uma chave hash.

CREATE OR REPLACE TABLE `projetorotaetl.dw_superstore.dim_envio` AS
WITH base AS (
  SELECT DISTINCT
    ship_mode AS modo_envio,
    order_priority AS prioridade_pedido
  FROM `projetorotaetl.super_store.superstore`
)
SELECT
  TO_HEX(MD5(CONCAT(modo_envio, '|', prioridade_pedido))) AS id_envio,
  modo_envio,
  prioridade_pedido
FROM base;
