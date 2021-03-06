#' @title Desenha grafico das RAs por semana
#'
#' @description Funcao que gera os graficos de casos e obitos, absolutos e por densidade para as RAs do Distrito Federal usando os dados por semana
#'
#' @param dados de cadastro por semana de obitos e casos do Distrito Federal e Regioes Adminsitrativas
#'
#' @return lista com quatro graficos de casos e obitos, absolutos e por densidade para as RAs do Distrito Federal usando os dados por semana
#'
#' @import data.table
#' @import ggplot2
#'
#' @export
#'
#' @examples
#'

desenha_series_ra <- function(dados){
  lista = list()

  dados = checa_transforma_dt(dados)

  dados = dados[!ra_fator %in% c("NA", "Distrito Federal"),]

  dados = dados[!is.na(ra_fator),]

  lista[[1]] = ggplot(dados, aes(x = data_max, y = casos)) +
    geom_col(fill = "darkblue") +
    facet_wrap(~ra_fator) +
    theme_bw() +
    labs(x = "Semana", y = "Casos por semana", fill = "Data") +
    scale_x_date(date_labels = "%B", date_breaks = "2 months") +
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  lista[[2]] =ggplot(dados, aes(x = data_max, y = obitos)) +
    geom_col(fill = "red4") +
    facet_wrap(~ra_fator) +
    theme_bw() +
    labs(x = "Semana", y = "Óbitos por semana", fill = "Data") +
    scale_x_date(date_labels = "%B", date_breaks = "2 months") +
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  lista[[3]] =ggplot(dados[!is.na(pop),], aes(x = data_max, y = casos_100k)) +
    geom_col(fill = "darkblue") +
    facet_wrap(~ra_fator) +
    theme_bw() +
    labs(x = "Semana", y = "Casos por 100 mil habitantes por semana", fill = "Data")+
    scale_x_date(date_labels = "%B", date_breaks = "2 months") +
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  lista[[4]] = ggplot(dados[!is.na(pop),], aes(x = data_max, y = obitos_100k)) +
    geom_col(fill = "red4") +
    facet_wrap(~ra_fator) +
    theme_bw() +
    labs(x = "Semana", y = "Óbitos por 100 mil habitantes por semana", fill = "Data")+
    scale_x_date(date_labels = "%B", date_breaks = "2 months") +
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  names(lista) <- c("casos_ra", "obitos_ra", "casos_dens_ra", "obitos_dens_ra")
  lista
}
