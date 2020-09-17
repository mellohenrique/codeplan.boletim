# Gera dados utilizados para teste
teste_min <- limpa_min_saude(teste)

# Roda Funcoes
dados_am <- gera_serie_estadual(teste_min, estados_selecionados = "AM")
dados_amdf <- gera_serie_estadual(teste_min, estados_selecionados = c("AM", "DF"))
dados_dt <- gera_serie_estadual(teste_min, produto_dt = TRUE)
dados_amdf_dt <- gera_serie_estadual(teste_min, estados_selecionados = c("AM", "DF"), produto_dt = TRUE)

# Teste da classe de resultados
expect_equal(class(dados_am), "data.frame")
expect_equal(class(dados_amdf), "data.frame")
expect_equal(class(dados_dt), c("data.table", "data.frame"))
expect_equal(class(dados_amdf_dt), c("data.table", "data.frame"))

# Teste de valores corretos de obitos e casos diarios
expect_equal(dados_df$casos[dados_am$data %in% as.Date(c("2020-08-06", "2020-08-11", "2020-08-16"))],
             c(804, 908, 671))
expect_equal(dados_df$obitos[dados_am$data %in% as.Date(c("2020-08-03", "2020-08-13", "2020-08-18"))],
             c(5, 18, 19))
expect_equal(dados_amdf$casos[dados_amdf$data %in% as.Date(c("2020-08-06", "2020-08-11", "2020-08-16"))],
             c(804, 908, 671, 2034, 1415, 1453))
expect_equal(dados_amdf$obitos[dados_amdf$data %in% as.Date(c("2020-08-03", "2020-08-13", "2020-08-18"))],
             c(5, 18, 19, 23, 35, 55))
