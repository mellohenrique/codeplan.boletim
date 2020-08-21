#' @title Classificador dos estados
#'
#' @description Funcao que recebe os dados de mortalidade e letalidade no formato do boletim e gera a classificao dos estados em diferentes informacoes a cerca da pandemia do COVID-19
#'
#' @param dados base dados no formato mortalidade letalidade
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

limpa_base_mortalidade_letalidade <- function(dados, produto_dt = FALSE){

  dados = as.data.table(dados_brutos)

  dados[estado != "Brasil", `:=` (
    rank_obitos = rank(-obitosAcumulado, ties.method = "min"),
    rank_mortalidade = rank(-mortalidade, ties.method = "min"),
    rank_letalidade = rank(-letalidade, ties.method = "min"),
    rank_casos = rank(-casosAcumulado, ties.method = "min"),
    rank_casos_novos = rank(-casosNovos, ties.method = "min"),
    rank_casos_dens = rank(-`casos_100k`, ties.method = "min"))]

  if(produto_dt) {
    dados
  } else {
    as.data.frame(dados)
  }
}
