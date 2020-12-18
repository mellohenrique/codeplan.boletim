#' @title Gera os produtos utilizados no boletim COVID 19 da codeplan
#'
#' @description Função que baixa os dados do ministério da saúde
#'
#' @inheritParams limpa_cadastro
#'
#' @return Um arquivo com os dados do ministério da saúde de COVID 19
#'
#' @export
#'
#' @examples
#'

gera_boletim_ra <- function(arquivo, local_resultados = "produto/", produto_dt = FALSE, max_data = NULL, prefixo = NULL){

  dados = limpa_cadastro(arquivo = arquivo, produto_dt = produto_dt)

  dados_semana = gera_cadastro_semana(dados, produto_dt = produto_dt)

  dados_top = gera_top_cadastro(dados_semana)

  graficos_ra = desenha_series_ra(dados_semana)

  graficos_top_ra = desenha_top_ras(dados_top)

  if (is.null(prefixo)){
    prefixo = max(dados$data)
    prefixo = paste0(prefixo, "-")
  }

  for (i in seq_along(graficos_ra)){
    ggplot2::ggsave(paste0(local_resultados, prefixo, names(graficos_ra)[i],".png"), graficos_ra[[i]],  width = 10.3152, height = 6.0984)
  }

  for (i in seq_along(graficos_top_ra)){
    ggplot2::ggsave(paste0(local_resultados, prefixo, names(graficos_top_ra)[i],".png"), graficos_top_ra[[i]],  width = 10.3152, height = 6.0984)
  }
}
