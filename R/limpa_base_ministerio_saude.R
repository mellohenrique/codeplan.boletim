#' @title Limpa os dados do ministerio da saude para o formato utilizado pelo boletim
#'
#' @description Recebe os dados no formato utilizado pelo ministerio da saude e limpa eles para o formato usado pelo boletim da codeplan
#'
#' @param dados base dados carregada do ministerio da saude a ser lida
#' @param produto_dt variavel logica que define se o produto da funcao e um data.table (se produto_dt == TRUE) ou um data.frame (se produto_dt = FALSE), padrao utilizado e FALSE
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


limpa_base_min_saude <- function(dados, produto_dt = FALSE){

  dados <- data.table(dados)

  dados <- dados[is.na(codmun) & regiao != "Brasil", .(data, estado, casosAcumulado, obitosAcumulado)]

  setnames(dados, names(dados), c("date", "state", "confirmed", "deaths"))

  dados[, date_tableau := as.character(format(as.Date(date),"%m-%d-%Y"))]

  dados[, `:=`(dia_centesimo_caso = cumsum(confirmed >= 100),
           dia_centesima_morte = cumsum(deaths >= 100)), by = state]

  if(produto_dt) {
    dados
  } else {
    as.data.frame(dados)
  }
}
