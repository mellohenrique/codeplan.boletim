# Teste da funcao desenha grafs semana

dados_uf <- codeplan.boletim::limpa_min_saude(teste)

dados_semana <- codeplan.boletim::limpa_semana(dados_uf)

graficos <- codeplan.boletim::desenha_grafs_semana(dados_semana)

expect_equal(length(graficos), 4)
expect_equal(class(graficos), "list")
expect_equal(class(graficos[[1]]), c("gg", "ggplot"))
