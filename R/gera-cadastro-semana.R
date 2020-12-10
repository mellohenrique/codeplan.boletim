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
    dados = dados
  } else {
    dados = data.table(dados_cadastro)
  }

  data = data.table(data = seq(as.Date(data_inicio), max(dados$data), by = "day"))

  data[, epiweek := cumsum(weekdays(data) == "domingo") + 1]

  dados[data, on = .(data = data), epiweek := epiweek ]

  dados[, .(casos = sum(casos)), by = .(epiweek, localidade)]

  dados[as.data.table(pop_ra), on = .(localidade = ra), pop := pop]

  dados[, `:=`(casos_100k = 100000 * casos / pop,
               obitos_100k = 100000 * casos / pop)]

  retorna_dt(dados, produto_dt)
}
