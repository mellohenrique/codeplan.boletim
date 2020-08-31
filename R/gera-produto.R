#' @title Gera os produtos utilizados no boletim COVID 19 da codeplan
#'
#' @description Função que baixa os dados do ministério da saúde
#'
#' @inheritParams limpa_min_saude
#'
#' @return Uma lista com os dados do ministerio da saude no formato UF, os dados de mortalidade e letalidade do ministerio da saude e os dados de classificacao dos estados do ministerio da saude
#'
#' @export
#'
#' @examples
#'

gera_produto <- function(dados, produto_dt = FALSE){
  dados_uf = limpa_min_saude(dados, produto_dt = produto_dt)

  dados_mortal_letal = limpa_mortalidade_letalidade(dados, produto_dt = produto_dt)

  classificacao_mortal_letal = classifica_mortalidade_letalidade(dados_mortal_letal, produto_dt = produto_dt)

  dados_semana = limpa_dados_semana(dados_uf, produto_dt = produto_dt)

  resultado = list(dados_uf, dados_mortal_letal, classificacao_mortal_letal, dados_semana)
  names(resultado) = c("dados_uf", "dados_mortal_letal", "classificacao_mortal_letal", "dados_semana")
  resultado
}
