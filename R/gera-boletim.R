#' @title Gera os produtos utilizados no boletim COVID 19 da codeplan
#'
#' @description Função que gera o boletim
#'
#' @param arquivo_uf Arquivo csv2 com os dados de UF do ministerios da Saude
#' @param arquivo_cadastro Arquivo csv2 com os dados de cadastro por pessoa do Distrito Federal
#' @param local_resultados Diretorio em que os arquivos gerados serao salvos
#' @param produto_dt Valor logico se os produtos gerados internamente da funcao serao no formato data.table
#' @param max_data Data maxima em que serao avaliados os dados de covid
#' @param prefixo Qual o prefixo sera utilizado para os resultados, padrao e utilizar a data maxima dos arquivos avaliados
#'
#' @return Um arquivo com os dados do ministério da saúde de COVID 19
#'
#' @export
#'
#' @examples
#'

gera_boletim <- function(arquivo_uf, arquivo_cadastro, local_resultados = "produto/", produto_dt = FALSE, max_data = NULL, prefixo = NULL){

  gera_boletim_uf(arquivo = arquivo_uf, local_resultados = local_resultados, produto_dt = produto_dt, max_data = max_data, prefixo = prefixo)

  gera_boletim_ra(arquivo = arquivo_cadastro, local_resultados = local_resultados, produto_dt = produto_dt, max_data = max_data, prefixo = prefixo)

}
