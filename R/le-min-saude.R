#' @title Le dados do ministério da saúde
#'
#' @description Le o ultimo dado do ministerio da saude
#'
#' @param  arquivo especifica o arquivo com os dados do ministerios da saude
#' @param max_data especifica a data em que se avaliará os dados
#'
#' @return Um data.frame com os dados do ministério da saúde de COVID 19
#'
#' @export
#'
#' @import data.table
#'
#' @examples
#'

le_min_saude <- function(arquivo,  max_data = NULL){

  dados = fread(arquivo,
                dec = ",",
                sep = ";",
                encoding = "UTF-8",
                colClasses=c("character","character","character",
                             "numeric","numeric","numeric", "character",
                             "character", "numeric", "numeric", "numeric",
                             "numeric", "numeric", "numeric",
                             "numeric", "numeric", "numeric"))

  dados[, data := {as.Date(data)}]

  if (!is.null(max_data)){
    dados = dados[data <= as.Date(max_data)]
  }

  dados
}
