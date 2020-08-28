# Teste sobre a funcao desenha_crescimento_semana
desenho_crescimento_semana <- codeplan.boletim::desenha_crescimento_semana(codeplan.boletim::limpa_min_saude(teste))

gg_build <- ggplot2::ggplot_build(desenho_crescimento_semana)

dados_graficos <- ggplot2::layer_data(desenho_crescimento_semana, 1)

expect_equal(class(desenho_crescimento_semana), c("gg", "ggplot"))
expect_equal(class(gg_build), c("ggplot_built"))

expect_equal(dados_graficos$y, c(0.04128340, 0.09597469))

