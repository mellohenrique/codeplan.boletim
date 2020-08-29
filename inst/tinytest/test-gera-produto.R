# Teste para funcao gera produto
expect_equal(class(gera_produto(teste, FALSE)), "list")
expect_equal(class(gera_produto(teste, TRUE)), "list")
expect_equal(dim(sapply(gera_produto(teste, TRUE), FUN =  class)), c(2, 3))
expect_equal(all(sapply(gera_produto(teste, TRUE), FUN =  class)[1,] == "data.table"), TRUE)
expect_equal(all(sapply(gera_produto(teste, TRUE), FUN =  class)[2,] == "data.frame"), TRUE)
expect_equal(all(sapply(gera_produto(teste, FALSE), FUN =  class) == "data.frame"), TRUE)

