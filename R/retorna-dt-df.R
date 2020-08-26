#' @title Retorna data.frame ou data.table
#'
#' @description Recebe um data.table e determina se transforma em data.frame ou continua dt
#'
#' @param dados Um objeto da classe data.table
#' @param produto_dt variavel logica que define se o produto da funcao e um data.table (se produto_dt == TRUE) ou um data.frame (se produto_dt = FALSE), padrao utilizado e FALSE
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
