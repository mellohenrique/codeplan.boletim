#' @title Gera os produtos utilizados no boletim COVID 19 da codeplan
#'
#' @description Função que baixa os dados do ministério da saúde
#'
#' @param  local local para salvar a base da dados obtida do ministerio da saude, padrao e salvar para a pasta "dados" do diretorio atual
#'
#' @return Um arquivo com os dados do ministério da saúde de COVID 19
#'
#' @export
#'
#' @examples
#'

gera_produto <- function(local = "dados/", local_resultados = "produto/", produto_dt = FALSE, data_dados = NULL, prefixo = NULL){

  if(is.null(data_dados)){
    baixa_min_saude(local = local)
    }

  dados_brutos = le_dados_ministerio_saude(local = local, data_dados = data_dados)

  dados_uf = limpa_base_min_saude(dados_brutos, produto_dt = produto_dt)

  dados_mortal_letal = limpa_base_mortalidade_letalidade(dados_brutos, produto_dt = produto_dt)

  classificacao_mortal_letal = classifica_mortalidade_letalidade(limpa_base_mortalidade_letalidade(dados_brutos, produto_dt = produto_dt))

  if (is.null(prefixo)){
    prefixo = max(dados_uf$date)
    }

  readr::write_excel_csv2(dados_uf, paste0(local_resultados, prefixo, "-uf.csv"))
  readr::write_excel_csv2(dados_mortal_letal, paste0(local_resultados, prefixo, "-mortal-letal.csv"))
  readr::write_excel_csv2(classificacao_mortal_letal, paste0(local_resultados, prefixo, "-classificao-mortal-letal.csv"))

}
