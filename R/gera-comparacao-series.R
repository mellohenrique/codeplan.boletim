#' @title Gera comparação de séries da SSP
#'
#' @description Função que faz a comparação das séries de dados da SSP
#'
#'
#' @return
#'
#' @export
#'
#' @examples
#'


gera_comparacao_series <- function(){
  # Desenha comparação das sérires
  dados_df <- readr::read_csv2("produto/2020-09-27-uf.csv")

  arquivos <- dir("dados/")

  lista_ssp  <- purrr::map(paste0("dados/", arquivos[str_detect(arquivos, "extracao")]),
                           ~(fread(.x, sep = ";", dec = ",") %>% mutate(primeiros_sintomas = as.Date(primeiros_sintomas))))

  # Definindo graficos
  grafs_metodo <- desenha_series_metodo(dados_df, lista_ssp[[4]])
  names(grafs_metodo) <- c("metodo-casos", "metodo-obitos")
  grafs_temporal <- desenha_series_temporal(lista_ssp, c("2020-09-08", "2020-09-14", "2020-09-21", "2020-09-28"))
  names(grafs_temporal) <- c( "temporal-casos", "temporal-obitos")

  # Salvando graficos
  walk2(grafs_metodo, names(grafs_metodo),
        ~ggplot2::ggsave(paste0("produto/", .y,".png"), .x,  width = 10.3152, height = 6.0984))

  walk2(grafs_temporal, names(grafs_temporal),
        ~ggplot2::ggsave(paste0("produto/", .y,".png"), .x,  width = 10.3152, height = 6.0984))
}
