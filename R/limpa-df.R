#' @title Gera serie DF extracao direta
#'
#' @description Recebe os dados no formato utilizado pelo ministerio da saude e limpa eles para o formato usado pelo boletim da codeplan
#'
#' @inheritParams limpa_mortalidade_letalidade
#' @param dados_df data.frame com os dados de cada caso do Distrito Federal
#' @param ra Valor logico, se TRUE considera a serie historica por RA, se FALSE apenas para o Distrito Federal
#'
#' @return Um data.frame com os dados da serie historica do Distrito Federal
#'
#' @import data.table
#'
#' @export
#'

limpa_df <- function(dados_df, ra = FALSE, produto_dt = FALSE){

  dados = checa_transforma_dt(dados_df)

  dados[, `:=` (primeiros_sintomas = {as.Date(primeiros_sintomas)},
                dataobito = {as.Date(ifelse(estado_de_saude == "obito", as.character(dataobito), NA_character_))})]

  if(ra){
    casos = setDT(dados)[, .N, keyby = c("primeiros_sintomas", "ra_localid")]
    setnames(casos, c("data", "ra", "casos"))

    obitos = setDT(dados)[, .N, keyby = c("dataobito", "ra_localid")][!is.na(dataobito),]
    setnames(obitos, c("data", "ra", "obitos"))

    ra_data = expand.grid(seq(min(c(casos$data, obitos$data)), max(c(casos$data, obitos$data)), by="days"),
                          unique(dados$ra_localid))

    ra_data = as.data.table(ra_data)

    setnames(ra_data, c("data", "ra"))

    df_serie = merge(ra_data, casos, all = TRUE, by = c("data" = "data", "ra" = "ra"))
    df_serie = merge(df_serie, obitos, all = TRUE, by = c("data" = "data", "ra" = "ra"))

    df_serie[, `:=`(casos = {ifelse(is.na(casos), 0, casos)},
                    obitos = {ifelse(is.na(obitos), 0, obitos)}),
             by = ra]

    df_serie[, `:=`(casos_acumulados = {cumsum(casos)},
                    obitos_acumulados = {cumsum(obitos)}),
             by = ra]
  } else {
    casos = setDT(dados)[, .N, keyby = primeiros_sintomas]
    setnames(casos, c("data", "casos"))

    obitos = setDT(dados)[, .N, keyby = dataobito][!is.na(dataobito),]
    setnames(obitos, c("data", "obitos"))

    datas = data.table(data = seq(min(c(casos$data, obitos$data)), max(c(casos$data, obitos$data)), by="days"))

    df_serie = merge(datas, casos, all = TRUE, by = c("data" = "data"))
    df_serie = merge(df_serie, obitos, all = TRUE, by = c("data" = "data"))

    df_serie[, `:=`(casos = {ifelse(is.na(casos), 0, casos)},
                    obitos = {ifelse(is.na(obitos), 0, obitos)})]

    df_serie[, `:=`(casos_acumulados = {cumsum(casos)},
                    obitos_acumulados = {cumsum(obitos)})]
  }

  retorna_dt_df(df_serie, produto_dt = produto_dt)
}
