#' @title Gera serie estadual
#'
#' @description Função que baixa os dados do ministério da saúde
#'
#' @inheritParams limpa_semana
#' @param estados_selecionados Vetor de caracteres com os estados que seram selecionados do conjunto de dados estaduais
#'
#' @return Um data.frame com a serie historica de casos, obitos, casos acumulados e obitos para cada dia disponivel
#'
#' @export
#'
#' @examples
#'

gera_serie_estadual <- function(dados_uf, produto_dt = FALSE, estados_selecionados = "DF"){

  dados = as.data.table(dados_uf)

  dados = dados[, .(data = as.Date(date),
                    estado = state,
                    casos = { confirmed - shift(confirmed, 1, fill = 0)},
                    casos_acumulados = confirmed,
                    obitos = {deaths - shift(deaths, 1, fill = 0)},
                    obitos = deaths),
                by = state]

  dados = dados[estado %in% estados_selecionados,]

  retorna_dt_df(dados, produto_dt = produto_dt)
}