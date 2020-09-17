#' @title Gera os produtos utilizados no boletim COVID 19 da codeplan
#'
#' @description Função que baixa os dados do ministério da saúde
#'
#' @inheritParams limpa_mortalidade_letalidade
#' @param dados_uf Dados do ministerio da saude por UF limpos
#'
#' @return Um arquivo com os dados dde casos e obitos por semana do ministério da saúde de COVID 19
#'
#' @export
#'
#' @examples
#'
#'

limpa_semana <- function(dados_uf, produto_dt = FALSE){

  dados_uf = as.data.table(dados_uf)

  dados_uf = dados_uf[weekdays(date) == "sábado", .(date, state, confirmed, deaths)]

  dados_uf[, `:=`(obitos_semana = {deaths - shift(deaths, 1, fill = 0)},
                  casos_semana = confirmed - shift(confirmed, 1, fill = 0)), by = state]

  dados_uf[pop, on = .(state = state), pop := pop]

  dados_uf[, `:=`(confirmed_100k = {100000 * casos_semana/ pop},
                  deaths_100k = {100000 * obitos_semana / pop},
                  date = as.Date(date))]

  retorna_dt_df(dados_uf, produto_dt = produto_dt)
}
