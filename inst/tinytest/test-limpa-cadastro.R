# Escreve arquivos
write.csv2(file = "x.csv", teste_df)

# Testando arquivos
dados <- limpa_cadastro("x.csv")
dados_dt <- limpa_cadastro("x.csv", produto_dt = TRUE)

# Testes da classe correta do produto
expect_equal(class(dados), "data.frame")
expect_equal(class(dados_dt), c("data.table", "data.frame"))

# Testes da operacao correta da funcao sobre o DF inteiro
expect_equal(max(dados$data), as.Date("2020-09-01"))
expect_equal(max(dados$casos), 25)
expect_equal(min(dados$casos), 2)
expect_equal(dados$casos[dados$data == as.Date("2020-08-15")], c(6, 11, 17))
expect_equal(dados$obitos[dados$data == as.Date("2020-08-15")], c(2, 1, 3))

# Testes da operacao correta da funcao sobre ra
expect_equal(max(dados[dados$localidade == "Sudoeste",]$casos), 17)
expect_equal(max(dados[dados$localidade == "Plano Piloto",]$casos), 14)
expect_equal(dim(dados[dados$localidade == "Sudoeste",]), c(32, 4))
expect_equal(dim(dados[dados$localidade == "Plano Piloto",]), c(32, 4))
expect_equal(dim(dados[dados$localidade == "Distrito Federal",]), c(32, 4))

# Checar existencia
if (file.exists("x.csv")){
  # Deleta arquivos
  file.remove("x.csv")
}


