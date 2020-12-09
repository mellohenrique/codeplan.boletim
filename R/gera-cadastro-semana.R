#' @title Gera dados de cadastro por semana
#'
#' @description Funcao que recebe os dados de casos e obitos por dia por regiao administrativa por data do cadastro da SSP e gera dados por semana
#'
#' @param caminho_cadastro caminho com os dados da SSP de cadastro
#'
#' @return Um data.frame com os dados de serie temporal por semana dos dados de cadastro
#'
#' @import data.table
#'
#' @export


gera_cadastro_semana <- function(dados_cadastro, data_inicio = "2012-01-01", produto_dt = FALSE){
  if(is.data.table(dados_cadastro)){
    dados = dados[]
  } else {
    dados = data.table(dados_cadastro)
  }

  data = data.table(data = seq(as.Date("2020-01-01"), max(dados$data), by = "day"))

  data[, epiweek := cumsum(weekdays(data) == "domingo") + 1]

  dados[data, on = .(data = data), epiweek := epiweek ]

  retorna_dt(dados, produto_dt)
}
