#' @title Limpa os dados do ministerio da saude para o formato utilizado pelo boletim
#'
#' @description Recebe os dados no formato utilizado pelo ministerio da saude e limpa eles para o formato usado pelo boletim da codeplan
#'
#' @inheritParams limpa_mortalidade_letalidade
#'
#' @return Um data.frame com os dados do ministério da saúde de COVID 19
#'
#' @import data.table
#'
#' @export
#'
#' @examples
#'
#'


limpa_min_saude <- function(dados, produto_dt = FALSE){

  dados <- checa_transforma_dt(dados)

  dados = dados[is.na(codmun) & regiao != "Brasil", .(data, estado, casosAcumulado, obitosAcumulado)]

  setnames(dados, names(dados), c("date", "state", "confirmed", "deaths"))

  dados[, date_tableau := as.character(format(as.Date(date),"%m-%d-%Y"))]

  dados[, `:=`(dia_centesimo_caso = cumsum(confirmed >= 100),
           dia_centesima_morte = cumsum(deaths >= 100)), by = state]

  retorna_dt_df(dados, produto_dt = produto_dt)
}
