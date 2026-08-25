-- Dimensão Produto

CREATE OR REPLACE TABLE `projetorotaetl.dw_superstore.dim_produto` AS
SELECT DISTINCT
  product_id AS id_produto,
  product_name AS nome_produto,
  category AS categoria,
  sub_category AS sub_categoria
FROM `projetorotaetl.super_store.superstore`;
