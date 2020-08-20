#' @title Baixa dados do ministério da saúde
#'
#' @description Função que baixa os dados do ministério da saúde
#'
#' @param  local local para salvar a base da dados obtida do ministerio da saude, padrao e salvar para a pasta "dados" do diretorio atual
#'
#' @return Um arquivo com os dados do ministério da saúde de COVID 19
#'
#' @examples
#'

baixa_min_saude <- function(local = "dados/"){

  resposta = httr::GET("https://xx9p7hp1p7.execute-api.us-east-1.amazonaws.com/prod/PortalGeral", httr::add_headers("X-Parse-Application-Id" = "unAFkcaNDeXajurGB7LChj8SgQYS2ptm"))

  url = httr::content(resposta)[["results"]][[1]][["arquivo"]][["url"]]

  utils::download.file(url, paste0(local, stringr::str_extract(url, "[0-9]+[a-z]+[0-9]+\\.[a-z]+$")), mode = 'wb')

}
