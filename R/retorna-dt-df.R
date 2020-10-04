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
#' @examples
#' exemplo_mtcars <- data.table::data.table(mtcars)
#'
#' retorna_dt_df(exemplo_mtcars, produto_dt = TRUE)
#'
#' retorna_dt_df(exemplo_mtcars, produto_dt = FALSE)

retorna_dt_df <- function(dados, produto_dt){
  if(produto_dt) {
    dados
  } else {
    as.data.frame(dados)
  }
}
