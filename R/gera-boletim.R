#' @title Gera os produtos utilizados no boletim COVID 19 da codeplan
#'
#' @description Função que baixa os dados do ministério da saúde
#'
#' @inheritParams le_min_saude
#'
#' @return Um arquivo com os dados do ministério da saúde de COVID 19
#'
#' @export
#'
#' @examples
#'

gera_boletim <- function(arquivo, local_resultados = "produto/", produto_dt = FALSE, max_data = NULL, prefixo = NULL){

  dados_brutos = le_min_saude(arquivo = arquivo, max_data = max_data)

  lista_resultados <- gera_produto(dados_brutos, produto_dt = produto_dt)

  if (is.null(prefixo)){
    prefixo = max(lista_resultados[[1]]$date)
    prefixo = paste0(prefixo, "-")
  }

  fwrite(lista_resultados[[1]], file =  paste0(local_resultados, prefixo, "uf.csv"), sep = ";", dec = ",")
  fwrite(lista_resultados[[2]], file = paste0(local_resultados, prefixo, "mortal-letal.csv"), sep = ";", dec = ",")
  fwrite(lista_resultados[[3]], file = paste0(local_resultados, prefixo, "classificao-mortal-letal.csv"), sep = ";", dec = ",")
  fwrite(lista_resultados[[4]], file = paste0(local_resultados, prefixo, "semana.csv"), sep = ";", dec = ",")

  graf_crescimento_semana = desenha_crescimento_semana(lista_resultados[[1]])

  graficos_casos_semana = desenha_grafs_semana(lista_resultados[[4]])

  ggplot2::ggsave(paste0(local_resultados, prefixo, "crescimento-semana.png"), graf_crescimento_semana,  width = 10.3152, height = 6.0984)

  for (i in seq_along(graficos_casos_semana)){
    ggplot2::ggsave(paste0(local_resultados, prefixo, names(graficos_casos_semana)[i],".png"), graficos_casos_semana[[i]],  width = 10.3152, height = 6.0984)
  }

}
