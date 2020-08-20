#' @title Le dados do ministério da saúde
#'
#' @description Le o ultimo dado do ministerio da saude
#'
#' @param  local especifica local do qual carregar a base da dados obtida do ministerio da saude, padrao e carregar a partir da pasta "dados" do diretorio atual
#' @param data_dados especifica de que data os dados devem ser carregados, o padrao e ler a ultima base disponivel
#'
#' @return Um data.frame com os dados do ministério da saúde de COVID 19
#'
#' @examples
#'

le_dados_ministerio_saude <- function(local = "dados/", data_dados = NULL){

  try(if(!is.character(local)) {stop(("Defina um local como character"))})

  if (!is.null(data_dados)){
    try(if(stringr::str_detect(data_dados, "[0-9]{4}-[0-9]{2}-[0-9]{2}") |
           length(data_dados) != 10) {stop(("Defina a data no formato YYYY-MM-DD ou deixe como NULL"))})
  }

  if(is.null(data_dados)) {
    if(as.numeric(format(Sys.time(), "%H")) > 18){
    data_dados = format(Sys.Date(), "%d%b%Y")
    } else {
      data_dados = format(Sys.Date() - 1, "%d%b%Y")
      }
  } else {
    data_dados = format(as.Date(data_dados), "%d%b%Y")
  }

  readxl::read_excel(paste0(local, data_dados, ".xlsx"),
                     col_types = c("text", "text", "text", "numeric", "numeric", "numeric", "text", "date", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "logical"))

}
