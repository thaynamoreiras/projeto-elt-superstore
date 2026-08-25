-- Validação das chaves da tabela fato contra as dimensões

SELECT
  COUNT(*) AS total_fato,
  COUNTIF(dc.id_cliente IS NULL) AS clientes_sem_dim,
  COUNTIF(dp.id_produto IS NULL) AS produtos_sem_dim,
  COUNTIF(dl.id_localizacao IS NULL) AS locais_sem_dim,
  COUNTIF(dd.id_data IS NULL) AS datas_sem_dim,
  COUNTIF(de.id_envio IS NULL) AS envios_sem_dim
FROM `projetorotaetl.dw_superstore.fato_vendas` f
LEFT JOIN `projetorotaetl.dw_superstore.dim_cliente` dc USING (id_cliente)
LEFT JOIN `projetorotaetl.dw_superstore.dim_produto` dp USING (id_produto)
LEFT JOIN `projetorotaetl.dw_superstore.dim_localizacao` dl USING (id_localizacao)
LEFT JOIN `projetorotaetl.dw_superstore.dim_data` dd USING (id_data)
LEFT JOIN `projetorotaetl.dw_superstore.dim_envio` de USING (id_envio);

-- O esperado, conforme a documentação do projeto, é 0 nas colunas *_sem_dim.
