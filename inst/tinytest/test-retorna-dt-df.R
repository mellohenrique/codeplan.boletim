# Teste da funcao retorna_dt_df
expect_equal(class(codeplan.boletim::retorna_dt_df(as.data.table(teste), produto_dt = TRUE)), c("data.table", "data.frame"))
expect_equal(class(codeplan.boletim::retorna_dt_df(as.data.table(teste), produto_dt = FALSE)), "data.frame")
