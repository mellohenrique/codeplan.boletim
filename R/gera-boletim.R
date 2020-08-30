#' @title Gera os produtos utilizados no boletim COVID 19 da codeplan
#'
#' @description Função que baixa os dados do ministério da saúde
#'
#' @inheritParams le_dados_ministerio_saude
#'
#' @return Um arquivo com os dados do ministério da saúde de COVID 19
#'
#' @export
#'
#' @examples
#'

gera_boletim <- function(local = "dados/", local_resultados = "produto/", produto_dt = FALSE, data_dados = NULL, prefixo = NULL){

  if (is.null(data_dados)) {
    baixa_min_saude(local = local)
  }

  dados_brutos = le_dados_ministerio_saude(local = local, data_dados = data_dados)

  lista_resultados <- gera_produto(dados_brutos, produto_dt = produto_dt)

  if (is.null(prefixo)){
    prefixo = max(lista_resultados[[1]]$date)
    prefixo = paste0(prefixo, "-")
  }

  readr::write_excel_csv2(lista_resultados[[1]], paste0(local_resultados, prefixo, "uf.csv"))
  readr::write_excel_csv2(lista_resultados[[2]], paste0(local_resultados, prefixo, "mortal-letal.csv"))
  readr::write_excel_csv2(lista_resultados[[3]], paste0(local_resultados, prefixo, "classificao-mortal-letal.csv"))

  graf_crescimento_semana = desenha_crescimento_semana(lista_resultados[[1]])

  graficos_casos_semana = desenha_grafs_semana(lista_resultados[[4]])

  ggplot2::ggsave(paste0(local_resultados, prefixo, "crescimento-semana.png"), graf_crescimento_semana,  width = 7.368, height = 4.356)

  for (i in seq_along(graficos_casos_semana)){
    ggplot2::ggsave(paste0(local_resultados, prefixo, names(graficos_casos_semana),".png"), graficos_casos_semana[[i]],  width = 7.368, height = 4.356)
  }
}
