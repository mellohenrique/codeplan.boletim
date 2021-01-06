#' Base com populacao por estado
#'
#' Uma base de dados da populacao por estados
#'
#' @format Uma tabela com 2 colunas e 35 linhas.
#' \describe{
#'   \item{estado}{Variavel em caractere com o estado da localidade}
#'   \item{pop}{Variavel numerica com o numero de pessoas na localidade segundo o TCU para o ano de 2019}
#' }
#' @source Tabela Criada a partir dos dados do TCU
"pop"

#' Base com codigos das capitais das unidades da federacao brasileira
#'
#' Uma base de dados com os codigos ibge das capitais das unidades da federacao brasileiras e brasilia
#'
#' @format Uma tabela com 2 colunas e 27 linhas.
#' \describe{
#'   \item{capitais}{Variavel em caracteres com o nome das capitais das unidades da federacao brasileiras}
#'   \item{ibge}{Variavel numerica com o codigo ibge das capitais das unidades da federacao brasileiras}
#' }
#' @source Tabela Criada a partir dos dados do IBGE
"capitais"


#' Base com populacao por regiao administrativa
#'
#' Uma base de dados da populacao por regiao administrativa do Distrito Federal
#'
#' @format Uma tabela com 2 colunas e 35 linhas.
#' \describe{
#'   \item{estado}{Variavel em caracteres com o regiao administrativa da localidade}
#'   \item{pop}{Variavel numerica com o numero de pessoas na regiao administrativa}
#' }
#' @source Tabela Criada a partir dos dados da CODEPLAN
"pop_ra"

#' Base de teste para o pacote
#'
#' Uma base de dados ficticia para testar as funcoes do pacote do Distrito Federal
#'
#' @format Uma tabela com 17 colunas e 1300 linhas.
#' \describe{
#'   \item{id}{Variavel numerica com o id de cada observacao}
#'   \item{primeiros_sintomas}{Variavel em data com a data dos primeiros sintomas}
#'   \item{dataobito}{Variavel em data com a data do obito}
#'   \item{estado_de_saude}{Variavel em caractere com o estado de saude da pessoa}
#'   \item{cadastro}{Variavel em data com a data de cadastro}
#' }
#' @source Tabela Ficticia para testar as funcoes para gerar dados da serie do Distrito Federal
"teste_df"

#' Base de teste para o pacote
#'
#' Uma base de dados para testar as funcoes do pacote
#'
#' @format Uma tabela com 17 colunas e 1300 linhas.
#' \describe{
#'   \item{regiao}{Variavel em caractere com a regiao do Brasil da localidade}
#'   \item{estado}{Variavel em caractere com o estado da localidade}
#'   \item{municipio}{Variavel em caractere com o municipio da localidade}
#'   \item{coduf}{Variavel numerica com o codigo do estado}
#'   \item{codmun}{Variavel numerica com o codigo do municipio}
#'   \item{codRegiaoSaude}{Variavel numerica com o codigo da regiao de saude}
#'   \item{nomeRegiaoSaude}{Variavel em caractere com o nome da regiao de saude da localidade}
#'   \item{data}{Variavel em data tempo com a data dos dados}
#'   \item{semanaEpi}{Variavel numerica com o numero da semana epidemiologica dos dados}
#'   \item{populacaoTCU2019}{Variavel numerica com o numero de pessoas na localidade segundo o TCU para o ano de 2019}
#'   \item{casosAcumulado}{Variavel numerica com o numero de casos acumulados para a localidade em uma determinada data}
#'   \item{casosNovos}{Variavel numerica com o numero de casos novos (do dia) para a localidade em uma determinada data}
#'   \item{obitosAcumulado}{Variavel numerica com o numero de obitos acumulados para a localidade em uma determinada data}
#'   \item{obitosNovos}{Variavel numerica com o numero de obitos novos (do dia) para a localidade em uma determinada data}
#'   \item{Recuperadosnovos}{Variavel numerica com o numero de novas pessoas recuperadas}
#'   \item{emAcompanhamentoNovos}{Variavel numerica com o numero de novos casos em acompanhamento}
#'   \item{`interior/metropolitana`}{Variavel logica que descreve se a area e metropolitana ou do interior}
#' }
#' @source Tabela Criada com base nos dados do ministerio da Saude
"teste"
