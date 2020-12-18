# Escreve arquivos
write.csv2(file = "x.csv", teste_df)

# Testando arquivos
dados <- gera_cadastro_semana(limpa_cadastro("x.csv"))
dados_dt <- gera_cadastro_semana(limpa_cadastro("x.csv", produto_dt = TRUE), produto_dt = TRUE)

# Teste estrutura
expect_equal(class(dados), "data.frame")
expect_equal(class(dados_dt), c("data.table", "data.frame"))

# Testa valores
expect_equal(dados$dias_semana, rep(7, 12))
expect_equal(dados$casos, c(49, 43, 57, 47, 51, 65, 59, 60, 100, 108, 116, 107))
expect_equal(dados$obitos, c(6, 22, 37, 35, 11, 18, 30, 53, 17, 40, 67, 88))
dados
expect_equal(unique(dados$pop), c(NA, 217073, 2881900))

# Checar existencia
if (file.exists("x.csv")){
  # Deleta arquivos
  file.remove("x.csv")
}

