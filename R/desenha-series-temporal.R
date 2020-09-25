#' @title Desenha grafico da comparacao entre diferentes datas de extracao
#'
#' @description
#'
#' @param lista_arquivos lista com data.frames com os dados de casos distrito federal limpos
#' @param vetor_data vetor com as datas de extracao dos data.frames da lista_arquivos no formato YYYY-MM-DD
#'
#' @return Dois graficos comparando a serie de casos e obitos, em media movel de sete dias, para diferentes datas de extracao
#'
#' @import data.table
#' @import ggplot2
#'
#' @export
#'
#' @examples
#'

desenha_series_temporal <- function(lista_arquivos, vetor_data){
  lista = list()
  for (i  in seq_along(lista_arquivos)){
    lista[[i]] = limpa_df(lista_arquivos[[i]], produto_dt = TRUE)

    lista[[i]][, `:=`(data_extracao = as.Date(vetor_data[[i]]),
                      casos_media_movel = frollmean(casos, 7),
                      obitos_media_movel = frollmean(obitos, 7))]

    lista[[i]]
  }

  dados = rbindlist(lista)

  datas_comuns = as.Date(as.data.table(table(dados$data))[N == length(vetor_data),][,V1])

  dados = dados[data %in% datas_comuns,]

  dados[, data_extracao := {as.factor(data_extracao)}]

  casos_media_movel = ggplot2::ggplot(dados, ggplot2::aes(x = data, y = casos_media_movel, color = data_extracao)) +
    ggplot2::geom_line() +
    ggplot2::scale_color_brewer(palette = "Set2") +
    ggplot2::scale_x_date(date_breaks = "months", date_labels = "%B") +
    ggplot2::labs(x = "", y = "Média móvel de 7 dias de casos diários", color = "Data extração:") +
    ggplot2::theme_bw()

  obitos_media_movel = ggplot2::ggplot(dados, ggplot2::aes(x = data, y = obitos_media_movel, color = data_extracao)) +
    ggplot2::geom_line() +
    ggplot2::scale_color_brewer(palette = "Set2") +
    ggplot2::scale_x_date(date_breaks = "months", date_labels = "%B") +
    ggplot2::labs(x = "", y = "Média móvel de 7 dias de óbitos diários", color = "Data extração:") +
    ggplot2::theme_bw()

  list(casos = casos_media_movel,
       obitos = obitos_media_movel)
}
