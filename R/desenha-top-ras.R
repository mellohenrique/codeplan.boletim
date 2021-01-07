#' @title Desenha grafico das RAs com maior crescimento por semana
#'
#' @description Funcao que gera os graficos de casos e obitos, absolutos das últimas quatro semanas para as RAs que apresentaram maior crescimento de obitos e casos
#'
#' @param dados_top dados de cadastro por semana de obitos e casos das regioes administrativas com maior crescimento de casos e obitos nas ultimas duas semanas
#'
#' @return lista com dois graficos de casos e obitos absolutos e por densidade para as RAs do Distrito Federal com maior crescimento
#'
#' @import data.table
#' @import ggplot2
#'
#' @export
#'
#' @examples
#'
# Testando arquivos

desenha_top_ras <- function(dados_top){
  dados_top = checa_transforma_dt(dados_top)

  top_casos_graf = dados_top[top_casos &
                               epiweek %in% (max(epiweek) - 3):max(epiweek),]
  top_obitos_graf = dados_top[top_obitos &
                               epiweek %in% (max(epiweek) - 3):max(epiweek),]

  # Organizando fatores
  localidades_casos = top_casos_graf[epiweek == max(epiweek),]

  setorder(localidades_casos, -crescimento_casos)

  localidades_casos = data.table(
    localidade_fator = factor(as.character(localidades_casos$localidade),
                             ordered = TRUE,
                             levels = as.character(localidades_casos$localidade)),
    localidade = as.character(localidades_casos$localidade))

  localidades_obitos = top_obitos_graf[epiweek == max(epiweek),]

  setorder(localidades_obitos, -crescimento_obitos)

  localidades_obitos = data.table(
    localidade_fator = factor(as.character(localidades_obitos$localidade),
                             ordered = TRUE,
                             levels = as.character(localidades_obitos$localidade)),
    localidade = localidades_obitos$localidade)

  # Organizando fator
  top_casos_graf = top_casos_graf[localidades_casos, on = .(localidade = localidade)]

  top_obitos_graf = top_obitos_graf[localidades_obitos, on = .(localidade = localidade)]

  # Desenhando graficos
  graficos = list()

  graficos[[1]] = ggplot(top_casos_graf,aes(x = data, y = casos)) +
    geom_col(fill = "darkblue") +
    geom_label(aes(label = casos, y = casos + 50))  +
    facet_wrap(~localidade_fator, dir = "h") +
    theme_bw() +
    labs(x = "Semana", y = "Casos por semana", title = "", fill = "Data") +
    scale_x_date(date_labels = "%B", date_breaks = "2 months") +
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  graficos[[2]] = ggplot(top_obitos_graf,aes(x = data, y = obitos)) +
    geom_col(fill = "red4") +
    geom_label(aes(label = obitos, y = obitos + 0.8))  +
    facet_wrap(~localidade_fator, dir = "h") +
    theme_bw() +
    labs(x = "Semana", y = "Casos por semana", title = "", fill = "Data") +
    scale_x_date(date_labels = "%B", date_breaks = "2 months") +
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  names(graficos) <- c("top-casos", "top-obitos")

  graficos
}
