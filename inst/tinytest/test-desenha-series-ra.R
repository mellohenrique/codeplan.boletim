# Escreve arquivos
write.csv2(file = "x.csv", teste_df)

# Testando arquivos
dados_brutos <- gera_cadastro_semana(limpa_cadastro("x.csv"))

dados <- gera_top_cadastro(dados_brutos, top = 2)
desenha_series_ra(dados_brutos)

# Teste da funcao desenha_series_temporal
resultado <- desenha_series_ra(dados_brutos)

# Teste do formato do resultado
expect_equal(class(resultado), "list")
expect_equal(sapply(resultado, class)[, 1], c("gg", "ggplot"))
expect_equal(sapply(resultado, class)[, 2], c("gg", "ggplot"))
expect_equal(sapply(resultado, class)[, 3], c("gg", "ggplot"))
expect_equal(sapply(resultado, class)[, 4], c("gg", "ggplot"))

# Checar existencia
if (file.exists("x.csv")){
  # Deleta arquivos
  file.remove("x.csv")
}
