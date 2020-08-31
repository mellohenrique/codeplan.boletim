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
    resultado = format(resultado, "%d/%m/%Y")
  } else if(variavel_retirada == "estado") {
    resultado = resultado
  } else if (percentual) {
    resultado = scales::percent(resultado, big.mark = ".", decimal.mark = ",", accuracy = 0.01)
  } else {
      resultado = scales::number(resultado, big.mark = ".", decimal.mark = ",", accuracy = 0.01)
  }

  resultado
}
