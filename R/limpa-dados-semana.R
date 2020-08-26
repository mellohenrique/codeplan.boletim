#' @title Gera os produtos utilizados no boletim COVID 19 da codeplan
#'
#' @description Função que baixa os dados do ministério da saúde
#'
#' @inheritParams limpa_base_mortalide_letalidade
#' @param dados_uf Dados do ministerio da saude por UF limpos
#'
#' @return Um arquivo com os dados dde casos e obitos por semana do ministério da saúde de COVID 19
#'
#' @export
#'
#' @examples
#'
#'

limpa_dados_semana <- function(dados_uf, produto_dt){
  dados_uf[, semana := cumsum(weekdays(date) == "domingo"),by = state]
  dados_uf[, `:=`(confirmed = max(confirmed),
                  deaths = max(deaths),
                  data = max(date)),
           by = .(state, semana)]

  dados_uf = dados_uf[weekdays(date) == "sábado", .(date, state, confirmed, deaths)]

  retorna_dt_df(dados_uf, produto_dt = produto_dt)
}
