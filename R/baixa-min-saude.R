#' @title Baixa dados do ministério da saúde
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

baixa_min_saude <- function(local = "dados/"){

  # Define link a baixar
  resposta = httr::GET("https://xx9p7hp1p7.execute-api.us-east-1.amazonaws.com/prod/PortalGeral", httr::add_headers("X-Parse-Application-Id" = "unAFkcaNDeXajurGB7LChj8SgQYS2ptm"))

  # Define nomes de arquivos que serao usados
  url = httr::content(resposta)[["results"]][[1]][["arquivo"]][["url"]]

  nome_arquivo = stringr::str_extract(url, "[0-9]+[a-z]+[0-9]+\\.[a-z]+$")

  nome_arquivo = paste0(as.Date(stringr::str_extract(nome_arquivo, "[0-9]+[a-z]+[0-9]+"), format = "%d%b%Y"), "-ministerio-saude.csv")

  arquivo_zip = stringr::str_remove(stringr::str_extract(url, "HIST.+"), ".zip")
  arquivo_csv = stringr::str_c(arquivo_zip, ".csv")

  # Baixa arquivo e salva na pasta desejada
  temp = tempfile()

  utils::download.file(url, temp)

  unzip(temp, exdir = stringr::str_remove(local, "/"), junkpaths = TRUE)

  # Renomeia arquivo
  file.rename(paste0(local, arquivo_csv), paste0(local, nome_arquivo))
}
