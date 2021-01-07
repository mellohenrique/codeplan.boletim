#' @title Limpa dados COVID-19 das capitais brasileiras
#'
#' @description Recebe os dados no formato utilizado pelo ministerio da saude e limpa eles para o formato usado pelo boletim da codeplan na planilha de letalidade mortalidade das capitais brasileiras
#'
#' @inheritParams limpa_mortalidade_letalidade
#'
#' @return Um data.frame com os dados do ministério da saúde de COVID 19 para as capitais brasileiras
#'
#' @import data.table
#'
#' @export
#'
#' @examples
#'

limpa_capitais <- function(dados, produto_dt = FALSE){

  dados = checa_transforma_dt(dados)

  dados_capitais = dados[codmun %in% as.integer(capitais$ibge %/% 10),]

  dados_capitais[, `:=`(mortalidade = obitosAcumulado * 100000 / populacaoTCU2019,
                        letalidade = obitosAcumulado/casosAcumulado)]

  dados_finais = dados_capitais[data == max(data), .(data, estado, municipio, casosAcumulado, obitosAcumulado, populacaoTCU2019, mortalidade, letalidade)]

  retorna_dt_df(dados_finais, produto_dt = produto_dt)
}
