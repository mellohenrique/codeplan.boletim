#' @title Desenha graficos da semana com dados semanais
#'
#' @description Funcao que recebe os dados casos por semana e gera os graficos utilizados no boletim em uma lista
#'
#' @param dados_semana Tabela de dados no formato data.frame utilizada para gerar os graficos em ggplot2 dos casos por semana
#'
#' @return Um data.frame com os dados do ministério da saúde de COVID 19 agrupados por semana
#'
#' @import data.table
#' @import ggplot2
#'
#' @export
#'
#' @examples
#'


desenha_grafs_semana <- function(dados_semana){

  obitos_semana = ggplot(dados_semana, aes(x = date, y = obitos_semana)) +
    geom_col(fill = "red4") +
    facet_wrap(~state) +
    labs(x = "", y = "Óbitos acumulados por semana") +
    theme_bw() +
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  casos_semana = ggplot(dados_semana, aes(x = date, y = casos_semana)) +
    geom_col(fill = "red4") +
    facet_wrap(~state) +
    labs(x = "", y = "Óbitos acumulados por semana") +
    theme_bw() +
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  dens_obitos = ggplot(dados_semana, aes(x = date, y = deaths_100k)) +
    geom_col(fill = "red4") +
    facet_wrap(~state) +
    labs(x = "", y = "Óbitos acumulados por cem mil habiantes por semana") +
    theme_bw() +
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  dens_casos = ggplot(dados_semana, aes(x = date, y = confirmed_100k)) +
    geom_col(fill = "darkblue") +
    facet_wrap(~state) +
    labs(x = "", y = "Casos acumulados por cem mil habiantes por semana") +
    theme_bw() +
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  resultado = list(obitos_semana, casos_semana, dens_obitos, dens_casos)
  names(resultado) = c("obitos_semana", "casos_semana", "dens_obitos", "dens_casos")
  resultado
}
