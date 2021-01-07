# Teste para funcao gera produto
expect_equal(class(gera_produto_uf(teste, FALSE)), "list")
expect_equal(class(gera_produto_uf(teste, TRUE)), "list")
expect_equal(dim(sapply(gera_produto_uf(teste, TRUE), FUN =  class)), c(2, 5))
expect_equal(all(sapply(gera_produto_uf(teste, TRUE), FUN =  class)[1,] == "data.table"), TRUE)
expect_equal(all(sapply(gera_produto_uf(teste, TRUE), FUN =  class)[2,] == "data.frame"), TRUE)
expect_equal(all(sapply(gera_produto_uf(teste, FALSE), FUN =  class) == "data.frame"), TRUE)

