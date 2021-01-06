#' @title Gera serie estadual
#'
#' @description Funcao que retira os dados de um restado dos dados do ministerio da saude limpos
#'
#' @inheritParams limpa_semana
#' @param estados_selecionados Vetor de caracteres com os estados que seram selecionados do conjunto de dados estaduais
#'
#' @return Um data.frame com a serie historica de casos, obitos, casos acumulados e obitos para cada dia disponivel para um estado especifico
#'
#' @export
#'
#' @examples
#'

gera_serie_estadual <- function(dados_uf, produto_dt = FALSE, estados_selecionados = "DF"){

  dados = checa_transforma_dt(dados_uf)

  dados = dados[, .(data = as.Date(date),
                    estado = state,
                    casos = { confirmed - shift(confirmed, 1, fill = 0)},
                    casos_acumulados = confirmed,
                    obitos = {deaths - shift(deaths, 1, fill = 0)},
                    obitos_acumulados = deaths),
                by = state]

  dados = dados[estado %in% estados_selecionados,]

  retorna_dt_df(dados, produto_dt = produto_dt)
}
