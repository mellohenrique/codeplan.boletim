# Escreve arquivos
write.csv2(file = "x.csv", teste_df)

# Testando arquivos
dados_brutos <- gera_cadastro_semana(limpa_cadastro("x.csv"))
dados_brutos$pop <- ifelse(is.na(dados_brutos$pop), 50000, dados_brutos$pop)

dados <- gera_top_cadastro(dados_brutos, top = 2)
dados_dt <- gera_top_cadastro(dados_brutos, top = 1, produto_dt = TRUE)
dados_filtrados <- dados[dados$top_casos, ]
dados_filtrados_dt <- dados_dt[dados_dt$top_obitos, ]

# Teste estrutura
expect_equal(class(dados), "data.frame")
expect_equal(class(dados_dt), c("data.table", "data.frame"))
expect_equal(class(dados_filtrados), "data.frame")
expect_equal(class(dados_filtrados_dt), c("data.table", "data.frame"))

# Testa valores
expect_equal(dados$dias_semana, rep(7,12))
expect_equal(dados_dt$dias_semana, rep(7,12))
expect_equal(dados_filtrados$dias_semana, rep(7,8))
expect_equal(dados_filtrados_dt$dias_semana, rep(7,4))

expect_equal(dados_filtrados$casos, c(49, 43, 57, 47, 51, 65, 59, 60))
expect_equal(dados_filtrados_dt$casos, c(51, 65, 59, 60))

expect_equal(dados_filtrados$obitos, c(6, 22, 37, 35, 11, 18, 30, 53))
expect_equal(dados_filtrados_dt$obitos, c(11, 18, 30, 53))

expect_equal(unique(dados$pop), c(50000, 217073, 2881900))

# Checar existencia
if (file.exists("x.csv")){
  # Deleta arquivos
  file.remove("x.csv")
}
