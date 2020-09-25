# Teste da funcao desenha_series_temporal
resultado <- desenha_series_metodo(limpa_min_saude(teste), teste_df)

# Teste do formato do resultado
expect_equal(class(resultado), "list")
expect_equal(sapply(resultado, class)[, 1], c("gg", "ggplot"))
expect_equal(sapply(resultado, class)[, 2], c("gg", "ggplot"))
