#' @title Gera dados de cadastro por semana
#'
#' @description Funcao que recebe os dados de casos e obitos por dia por regiao administrativa por data do cadastro da SSP e gera dados por semana
#'
#' @inheritParams limpa_mortalidade_letalidade
#' @param dados_cadastro dados da SSP de cadastro por dia por localidade
#' @param data_inicio data em que se comecara a contagem das semanas
#'
#' @return Um data.frame com os dados de serie temporal por semana dos dados de cadastro
#'
#' @import data.table
#'
#' @export


gera_cadastro_semana <- function(dados_cadastro, data_inicio = "2020-01-01", produto_dt = FALSE){
  if(is.data.table(dados_cadastro)){
    dados = dados_cadastro
  } else {
    dados = data.table(dados_cadastro)
  }

  data = data.table(data = seq(as.Date(data_inicio), max(dados$data), by = "day"))

  data[, epiweek := cumsum(weekdays(data) == "domingo") + 1]

  dados[data, on = .(data = data), epiweek := epiweek ]

  dados = dados[, .(casos = sum(casos),
                    obitos = sum(obitos),
                    dias_semana = .N,
                    data = max(data)), by = .(epiweek, localidade)]

  dados = dados[dias_semana == 7, ]

  dados[as.data.table(pop_ra), on = .(localidade = ra), pop := pop]

  dados[, `:=`(casos_100k = 100000 * casos / pop,
               obitos_100k = 100000 * obitos / pop)]

  retorna_dt_df(dados, produto_dt)
}
