# Testa bases
# Este arquivo testa se as bases usadas como teste tem as dimensoes adequadas e se constam do pacote

## Testes das dimensoes dos data.frames
expect_equal(dim(teste), c(1300, 17))
expect_equal(dim(pop), c(28, 2))
expect_equal(dim(teste_df), c(500, 5))

## Testes das classes dos data.frames
expect_equal(class(teste), "data.frame")
expect_equal(class(pop), "data.frame")
expect_equal(class(teste_df), "data.frame")

## Testes do numero correto de valores de datas e estados
expect_equal(as.data.frame(table(teste$estado))$Freq, c(1260, 40))
expect_equal(as.data.frame(table(teste$data))$Freq, rep(65, 20))
expect_equal(as.data.frame(table(pop$state))$Freq, rep(1, 28))
expect_equal(sum(is.na(teste_df$primeiros_sintomas)), 0)
expect_equal(sum(!is.na(teste_df$dataobito) & teste_df$estado_de_saude != "obito"), 1)

## Testes do correto nomes das localidades
expect_equal(unique(teste_df$ra_localid), c("Sudoeste", "Plano Piloto"))
expect_equal(as.character(as.data.frame(table(teste$estado))$Var1), c("AM", "DF"))
