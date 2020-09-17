#' @title Desenha grafico do crescimento da semana dos casos por UF
#'
#' @description Recebe os dados de casos por UF no formato utilizado pelo ministerio da saude e gera um grafico de crescimento do numero de casos na ultima semana
#'
#' @inheritParams limpa_semana
#'
#' @return Um grafico de crscimento semanal usado no boletim semanal da codeplan
#'
#' @import data.table
#' @import ggplot2
#'
#' @export
#'
#' @examples
#'

desenha_crescimento_semana <- function(dados_uf){
  if (!class(dados_uf)[1] == "data.table"){
    dados_uf = as.data.table(dados_uf)
  }

  dados_uf[,`:=`(crescimento_semana = {confirmed/shift(confirmed, 7) - 1}), by = state]

  dados_uf = dados_uf[date == max(date), .(state, crescimento_semana)]

  ggplot(dados_uf, aes(x = reorder(state, crescimento_semana), y = crescimento_semana, fill = (state == "DF"))) +
    geom_col() +
    coord_flip() +
    geom_label(aes(label = scales::percent(crescimento_semana, accuracy = 0.01, decimal.mark = ",", big.mark = "."), x = reorder(state, crescimento_semana), y = crescimento_semana + .008), fill = "white") +
    scale_fill_viridis_d(begin = 0.2, end = 1) +
    scale_y_continuous(labels = scales::percent_format()) +
    theme_bw() +
    labs(y = "Crescimento percentual na última semana", x = "") +
    guides(fill = FALSE)
}
