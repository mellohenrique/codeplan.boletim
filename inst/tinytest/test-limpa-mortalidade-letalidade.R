
# Teste sobre a funcao limpa_min_saude
limpeza_teste <- codeplan.boletim::limpa_mortalidade_letalidade(teste)

expect_equal(class(codeplan.boletim::limpa_mortalidade_letalidade(teste)), "data.frame")
expect_equal(class(codeplan.boletim::limpa_mortalidade_letalidade(teste, produto_dt = TRUE)), c("data.table", "data.frame"))

expect_equal(as.vector(table(limpeza_teste$estado)), c(1, 1))
expect_equal(names(table(limpeza_teste$estado)), c("AM", "DF"))

expect_equal(all(as.vector(table(limpeza_teste$data)) == as.vector(table(limpeza_teste$data))[1]), TRUE)

expect_equal(limpeza_teste$populacaoTCU2019, c(4144597, 3015268))
expect_equal(limpeza_teste$mortalidade, c(85.67781138, 72.96200537))
expect_equal(limpeza_teste$letalidade, c(0.0310578563, 0.0153033897))
expect_equal(limpeza_teste$casos_100k, c(2758.651806, 4767.702241))

