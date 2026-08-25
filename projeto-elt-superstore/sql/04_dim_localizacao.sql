-- Dimensão Localização
-- Como a fonte não possui location_id, o projeto gera uma chave hash consistente.

CREATE OR REPLACE TABLE `projetorotaetl.dw_superstore.dim_localizacao` AS
WITH base AS (
  SELECT DISTINCT
    country AS pais,
    state AS estado,
    city AS cidade,
    region AS regiao,
    market AS mercado
  FROM `projetorotaetl.super_store.superstore`
)
SELECT
  TO_HEX(MD5(CONCAT(pais, '|', estado, '|', cidade, '|', regiao, '|', mercado))) AS id_localizacao,
  pais,
  estado,
  cidade,
  regiao,
  mercado
FROM base;
