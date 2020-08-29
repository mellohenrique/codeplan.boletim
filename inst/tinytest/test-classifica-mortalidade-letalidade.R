
# Teste sobre a funcao limpa_base_min_saude
classifica_teste <- classifica_mortalidade_letalidade(limpa_mortalidade_letalidade(teste))

expect_equal(class(classifica_mortalidade_letalidade(limpa_mortalidade_letalidade(teste))), "data.frame")
expect_equal(class(classifica_mortalidade_letalidade(limpa_mortalidade_letalidade(teste), produto_dt = TRUE)), c("data.table", "data.frame"))


expect_equal(as.vector(table(classifica_teste$estado)), c(1, 1))
expect_equal(names(table(classifica_teste$estado)), c("AM", "DF"))

expect_equal(all(as.vector(table(classifica_teste$data)) == as.vector(table(classifica_teste$data))[1]), TRUE)
