
# Teste sobre a funcao limpa_base_min_saude
limpeza_teste <- codeplan.boletim::limpa_min_saude(teste)

expect_equal(class(codeplan.boletim::limpa_min_saude(teste)), "data.frame")
expect_equal(class(codeplan.boletim::limpa_min_saude(teste, produto_dt = TRUE)), c("data.table", "data.frame"))


expect_equal(as.vector(table(limpeza_teste$state)), c(20, 20))
expect_equal(names(table(limpeza_teste$state)), c("AM", "DF"))

expect_equal(all(as.vector(table(limpeza_teste$date)) == as.vector(table(limpeza_teste$date))[1]), TRUE)
