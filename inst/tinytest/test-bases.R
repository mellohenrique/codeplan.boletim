# Testa bases

expect_equal(dim(teste), c(1300, 17))
expect_equal(dim(pop), c(28, 2))

expect_equal(class(teste), c("data.frame"))
expect_equal(class(pop), c("data.frame"))

expect_equal(as.character(as.data.frame(table(teste$estado))$Var1), c("AM", "DF"))
expect_equal(as.data.frame(table(teste$estado))$Freq, c(1260, 40))

expect_equal(as.data.frame(table(pop$state))$Freq, rep(1, 28))
expect_equal(as.data.frame(table(teste$data))$Freq, rep(65, 20))
