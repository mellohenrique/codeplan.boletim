#' @title Limpa dados de cadastro
#'
#' @description Funcao que recebe os dados de casos e obitos por observacao por regiao administrativa por data do cadastro da SSP e gera dados por dias
#'
#' @inheritParams limpa_mortalidade_letalidade
#' @param caminho_cadastro caminho com os dados da SSP de cadastro
#'
#' @return Um data.frame com os dados de serie temporal dos dados de cadastro
#'
#' @import data.table
#'
#' @export


limpa_cadastro <- function(caminho_cadastro, produto_dt = FALSE){

  dados <- fread(caminho_cadastro, encoding = "UTF-8")

  dados[, `:=`(cadastro = as.Date(cadastro),
               dataobito = as.Date(dataobito))]

  casos = dados[, .(casos = .N), by = cadastro][, ra_localid := "Distrito Federal"]
  casos_ra = dados[, .(casos = .N), by = .(cadastro, ra_localid)]
  casos = rbind(casos, casos_ra)

  obitos = dados[estado_de_saude == "obito", .(obitos = .N), by = dataobito][, ra_localid := "Distrito Federal"]
  obitos_ra = dados[estado_de_saude == "obito", .(obitos = .N), by = .(dataobito, ra_localid)]
  obitos = rbind(obitos, obitos_ra)

  data <- expand.grid(data = seq(min(dados$cadastro, na.rm = TRUE),
                                 max(dados$cadastro, na.rm = TRUE),
                                 by = "day"),
                      localidade = c(unique(dados$ra_localid), "Distrito Federal"))

  data = data.table(data)

  dados = data[casos, on = .(data = cadastro, localidade = ra_localid), casos := casos]

  dados = dados[obitos, on = .(data = dataobito, localidade = ra_localid), obitos := obitos]

  dados[, `:=`(casos = ifelse(is.na(casos), 0, casos),
               obitos = ifelse(is.na(obitos), 0, obitos))]

 retorna_dt_df(dados, produto_dt)
}
