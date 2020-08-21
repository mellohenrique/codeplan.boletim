#' @title Limpa os dados do ministerio da saude para o formato utilizado pelo boletim na planilha mortalidade letalidade
#'
#' @description Recebe os dados no formato utilizado pelo ministerio da saude e limpa eles para o formato usado pelo boletim da codeplan na planilha de letalidade mortalidade
#'
#' @param dados base dados carregada do ministerio da saude a ser lida
#' @param produto_dt variavel logica que define se o produto da funcao e um data.table (se produto_dt == TRUE) ou um data.frame (se produto_dt = FALSE), padrao utilizado e FALSE
#'
#' @return Um data.frame com os dados do ministério da saúde de COVID 19
#'
#' @import data.table
#'
#' @export
#'
#' @examples
#'


limpa_base_mortalidade_letalidade <- function(dados, produto_dt = FALSE){

  dados = as.data.table(dados_brutos)

  dados = dados[data == max(data) & is.na(codmun), .(data, populacaoTCU2019, estado, casosAcumulado, obitosAcumulado, casosNovos)]

  dados[, `:=`(estado = ifelse(is.na(estado), "BR", estado),
           letalidade = obitosAcumulado/casosAcumulado,
           mortalidade = 100000 * obitosAcumulado/populacaoTCU2019,
           casos_100k = 100000 * casosAcumulado/populacaoTCU2019)]

  if(produto_dt) {
    dados
  } else {
    as.data.frame(dados)
  }
}
