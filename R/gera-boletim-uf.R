#' @title Gera os produtos utilizados no boletim COVID 19 da codeplan
#'
#' @description Função que gera os dados do boletim a cerca sobre covid das unidades da federacao
#'
#' @inheritParams gera_boletim
#'
#' @return Varios arquivos com o produto utilizados para fazer o boletim
#'
#' @export
#'
#' @examples
#'

gera_boletim_uf <- function(arquivo_uf, local_resultados = "produto/", produto_dt = FALSE, max_data = NULL, prefixo = NULL){

  dados_brutos = le_min_saude(arquivo = arquivo_uf, max_data = max_data)

  lista_resultados <- gera_produto_uf(dados_brutos, produto_dt = produto_dt)

  if (is.null(prefixo)){
    prefixo = max(lista_resultados[[1]]$date)
    prefixo = paste0(prefixo, "-")
  }

  for (i in seq_along(lista_resultados)){
    fwrite(lista_resultados[[i]], file =  paste0(local_resultados, prefixo, names(lista_resultados)[i],".csv"), sep = ";", dec = ",")
  }

  graf_crescimento_semana = desenha_crescimento_semana(lista_resultados[[1]])

  graficos_casos_semana = desenha_grafs_semana(lista_resultados[[5]])

  ggplot2::ggsave(paste0(local_resultados, prefixo, "crescimento-semana.png"), graf_crescimento_semana,  width = 10.3152, height = 6.0984)

  for (i in seq_along(graficos_casos_semana)){
    ggplot2::ggsave(paste0(local_resultados, prefixo, names(graficos_casos_semana)[i],".png"), graficos_casos_semana[[i]],  width = 10.3152, height = 6.0984)
  }

}
