
# Teste sobre a funcao limpa_min_saude
limpeza_teste <- codeplan.boletim::limpa_semana(codeplan.boletim::limpa_min_saude(teste))

expect_equal(class(codeplan.boletim::limpa_semana(codeplan.boletim::limpa_min_saude(teste))), "data.frame")
expect_equal(class(codeplan.boletim::limpa_semana(codeplan.boletim::limpa_min_saude(teste), produto_dt = TRUE)), c("data.table", "data.frame"))

expect_equal(as.vector(table(limpeza_teste$state)), c(3, 3))
expect_equal(names(table(limpeza_teste$state)), c("AM", "DF"))

expect_equal(all(weekdays(limpeza_teste$date) == weekdays(as.Date("2020-08-29"))), TRUE)

expect_equal(limpeza_teste$pop, c(4144597, 4144597, 4144597,  3015268, 3015268, 3015268))
expect_equal(limpeza_teste$confirmed, c(101777, 106428, 111241, 107922, 121824, 135014))
expect_equal(limpeza_teste$deaths, c(3278, 3364, 3463, 1490, 1712, 1958))
expect_equal(limpeza_teste$confirmed_100k, c(2455.65491650937337908545, 112.21838939 , 116.12709269, 3579.18433784326953173149, 461.05354483 , 437.44038673))
expect_equal(limpeza_teste$deaths_100k, c(79.09092247086991278593, 2.074990644, 2.388652021, 49.41517636243279554265, 7.362529633, 8.158478782))

expect_equal(class(limpeza_teste$date), "Date")

