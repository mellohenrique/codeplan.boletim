#' @title Classificador dos estados
#'
#' @description Funcao que recebe os dados de mortalidade e letalidade no formato do boletim e gera a classificao dos estados em diferentes informacoes a cerca da pandemia do COVID-19
#'
#' @inheritParams limpa_mortalidade_letalidade
#' @param dados_mor_let base dados no formato mortalidade letalidade
#'
#' @return Um data.frame com os dados do ministério da saúde de COVID 19
#'
#' @import data.table
#'
#' @export
#'
#' @examples
#'

classifica_mortalidade_letalidade <- function(dados_mor_let, produto_dt = FALSE){

  dados_mor_let = as.data.table(dados)

  dados_mor_let[estado != "Brasil", `:=` (
    rank_obitos = rank(-obitosAcumulado, ties.method = "min"),
    rank_mortalidade = rank(-mortalidade, ties.method = "min"),
    rank_letalidade = rank(-letalidade, ties.method = "min"),
    rank_casos = rank(-casosAcumulado, ties.method = "min"),
    rank_casos_novos = rank(-casosNovos, ties.method = "min"),
    rank_casos_dens = rank(-`casos_100k`, ties.method = "min"))]


  retorna_dt_df(dados_mor_let, produto_dt = produto_dt)
}
