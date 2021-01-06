#' @title Retorna data.frame ou data.table
#'
#' @description Recebe um data.table e determina se transforma em data.frame ou continua dt
#'
#' @param dados Um objeto da classe data.table
#'
#' @return Um data.frame ou data.table
#'
#' @import data.table
#'
#' @examples
#' retorna_dt_df(capitais, produto_dt = TRUE)
#' retorna_dt_df(capitais, produto_dt = FALSE)

retorna_dt_df <- function(dados, produto_dt){
  if(produto_dt) {
    dados
  } else {
    as.data.frame(dados)
  }
}

#' @title Checa e caso nao transforma em data.table
#'
#' @description Checa se um objeto e data.table e caso nao seja transforma em data.table
#'
#' @param dados um objeto data.frame ou data.table
#'
#' @return Um objeto em data.table
#'
#' @import data.table
#'
#' @examples
#' transforma_dt(capitais)


checa_transforma_dt <- function(dados){
  if (is.data.table(dados)){
    dados_uf = as.data.table(dados)
  }
  dados
}

#' @title Retira valor
#'
#' @description Retira o valor
#'
#' @param dados data.frame a ser avaliado
#' @param variavel_condicional Variavel em que se colocora uma condicao logica de igualdade
#' @param condicao Valor no qual a variavel condicional deve ser igualada
#' @param variavel_retirada Coluna do qual se retirara o valor
#' @param percentual Se utilizara percentual no resultado
#'
#' @return Um valor numerico formatado
#'
#' @export
#'
#' @examples
#'

retira_valor <- function(dados, variavel_condicional, condicao, variavel_retirada, percentual = FALSE){
  resultado = as.vector(dados[dados[, variavel_condicional] == condicao, variavel_retirada])

  if (variavel_retirada == "data"){
    resultado = format(as.Date(resultado), "%d/%m/%Y")
  } else if(variavel_retirada == "estado") {
    resultado = resultado
  } else if (percentual) {
    resultado = scales::percent(resultado, big.mark = ".", decimal.mark = ",", accuracy = 0.01)
  } else {
    resultado = scales::number(resultado, big.mark = ".", decimal.mark = ",", accuracy = 1)
  }

  resultado
}
