#' @title Desenha grafico da comparacao entre metodologias
#'
#' @description
#'
#' @param lista_arquivos lista com data.frames com os dados de casos distrito federal limpos
#' @param lista_data lista com as datas de extracao dos data.frames da lista_arquivos
#'
#' @return Dois graficos comparando a serie de casos e obitos, em media movel de sete dias, para diferentes metodologias
#'
#' @import data.table
#' @import ggplot2
#'
#' @export
#'
#' @examples
#'

desenha_series_metodo <- function(dados_ms, dados_ssp){

  dados_ms = gera_serie_estadual(dados_ms, produto_dt = TRUE)

  dados_ssp = limpa_df(dados_ssp, produto_dt = TRUE)

  lista <- list(dados_ms = dados_ms, dados_ssp = dados_ssp)

  for (i  in seq_along(lista)){
    if (i == 1) {
      metodo = "Ministerio da Saúde"
    } else {
      metodo = "Secretaria de Segurança Pública"
    }
    lista[[i]][, `:=`(metodo = metodo,
                      casos_media_movel = frollmean(casos, 7),
                      obitos_media_movel = frollmean(obitos, 7))]

    lista[[i]] = lista[[i]][!is.na(casos_media_movel), .(data, metodo, casos_media_movel, obitos_media_movel)]
  }

  dados = rbindlist(lista)

  casos_media_movel = ggplot2::ggplot(dados, ggplot2::aes(x = data, y = casos_media_movel, color = metodo)) +
    ggplot2::geom_line() +
    ggplot2::scale_color_brewer(palette = "Set2") +
    ggplot2::scale_x_date(date_breaks = "months", date_labels = "%B") +
    ggplot2::labs(x = "", y = "Média móvel de 7 dias de casos diários", color = "Data extração:") +
    ggplot2::theme_bw()

  obitos_media_movel = ggplot2::ggplot(dados, ggplot2::aes(x = data, y = obitos_media_movel, color = metodo)) +
    ggplot2::geom_line() +
    ggplot2::scale_color_brewer(palette = "Set2") +
    ggplot2::scale_x_date(date_breaks = "months", date_labels = "%B") +
    ggplot2::labs(x = "", y = "Média móvel de 7 dias de óbitos diários", color = "Data extração:") +
    ggplot2::theme_bw()

  list(casos = casos_media_movel,
       obitos = obitos_media_movel)
}
