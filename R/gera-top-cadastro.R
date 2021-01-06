#' @title Filtra localidades com maior crescimento dos dados de cadastro
#'
#' @description Funcao que recebe os dados de casos e obitos por semana por regiao administrativa por data do cadastro da SSP e filtra as observacoes com os principais casos
#'
#' @inheritParams limpa_mortalidade_letalidade
#' @param dados_cadastro_semana dados da SSP de cadastro por semana por localidade
#' @param top numero de regioes administrativas que seram filtradas
#'
#' @return Um data.frame com os dados de serie temporal dos dados de cadastro das localidades com maior crescimento de casos e obitos
#'
#' @import data.table
#'
#' @export

gera_top_cadastro <- function(dados_cadastro_semana, top = 6, produto_dt = FALSE){

  dados_cadastro_semana = checa_transforma_dt(dados_cadastro_semana)

  dados_filtrando = dados_cadastro_semana[, `:=`(crescimento_casos = casos + shift(casos, 1),
                                     crescimento_obitos = obitos + shift(obitos, 1)), by = localidade]

  dados_filtrando = dados_filtrando[epiweek == max(epiweek) & !localidade == "Distrito Federal" & !is.na(pop), ]

  top_obitos = dados_filtrando[crescimento_obitos %in% sort(dados_filtrando$crescimento_obitos, decreasing = TRUE)[1:top],]

  top_casos = dados_filtrando[crescimento_casos %in% sort(dados_filtrando$crescimento_casos, decreasing = TRUE)[1:top],]

  dados_cadastro_semana[, `:=`(top_obitos = localidade %in% top_obitos$localidade,
               top_casos = localidade %in% top_casos$localidade)]

  retorna_dt_df(dados_cadastro_semana, produto_dt)
}
