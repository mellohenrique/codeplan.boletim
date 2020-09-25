# Teste da funcao desenha_series_temporal
resultado <- desenha_series_temporal(lista_arquivos = list(teste_df, teste_df, teste_df), vetor_data = c("2020-09-01", "2020-08-01", "2020-07-01"))

# Teste do formato do resultado
expect_equal(class(resultado), "list")
expect_equal(sapply(resultado, class)[, 1], c("gg", "ggplot"))
expect_equal(sapply(resultado, class)[, 2], c("gg", "ggplot"))
