#' @title Retorna data.frame ou data.table
#'
#' @description Recebe um data.table e determina se transforma em data.frame ou continua dt
#'
#' @param dados Um objeto da classe data.table
#' @inheritParams limpa_mortalidade_letalidade
#'
#' @return Um data.frame ou data.table
#'
#' @import data.table
#'
#' @export
#'
#' @examples
#'
#'

retorna_dt_df <- function(dados, produto_dt){
  if(produto_dt) {
    dados
  } else {
    as.data.frame(dados)
  }
}
