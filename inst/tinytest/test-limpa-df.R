# Testes referentes a funcao limpa_df
teste <- limpa_df(teste_df)
teste_dt <- limpa_df(teste_df, produto_dt = TRUE)
teste_ra <- limpa_df(teste_df, ra = TRUE)
teste_ra_dt <- limpa_df(teste_df, ra = TRUE, produto_dt = TRUE)

# Testes da classe correta do produto
expect_equal(class(teste), "data.frame")
expect_equal(class(teste_dt), c("data.table", "data.frame"))
expect_equal(class(teste_ra), "data.frame")
expect_equal(class(teste_ra_dt), c("data.table", "data.frame"))

# Testes da operacao correta da funcao sobre o DF inteiro
expect_equal(max(teste$casos_acumulados), 500)
expect_equal(max(teste$data), as.Date("2020-09-01"))
expect_equal(max(teste$casos), 25)
expect_equal(min(teste$casos), 9)
expect_equal(teste$casos_acumulados[teste$data == as.Date("2020-08-15")], 226)
expect_equal(teste$obitos_acumulados[teste$data == as.Date("2020-08-25")], 162)

# Testes da operacao correta da funcao sobre ra
expect_equal(max(teste_ra$casos_acumulados), 268)
expect_equal(max(teste_ra[teste_ra$ra == "Sudoeste",]$casos_acumulados), 232)
expect_equal(max(teste_ra$data), as.Date("2020-09-01"))
expect_equal(max(teste_ra$casos), 17)
expect_equal(min(teste_ra$casos), 2)

# Separando plano piloto e sudoeste
plano <- teste_ra[teste_ra$ra == "Plano Piloto", ]
sudoeste <- teste_ra[teste_ra$ra == "Sudoeste", ]

# Testes para resultados das ras
expect_equal(plano$casos_acumulados[plano$data == as.Date("2020-08-17")], 142)
expect_equal(plano$obitos[plano$data == as.Date("2020-08-12")], 3)

expect_equal(sudoeste$obitos[sudoeste$data == as.Date("2020-08-29")], 5)
expect_equal(sudoeste$obitos_acumulados[sudoeste$data == as.Date("2020-08-21")], 59)

