% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/limpa-mortalidade-letalidade.R
\name{limpa_mortalidade_letalidade}
\alias{limpa_mortalidade_letalidade}
\title{Limpa os dados do ministerio da saude para o formato utilizado pelo boletim na planilha mortalidade letalidade}
\usage{
limpa_mortalidade_letalidade(dados, produto_dt = FALSE)
}
\arguments{
\item{dados}{base dados carregada do ministerio da saude a ser lida}

\item{produto_dt}{variavel logica que define se o produto da funcao e um data.table (se produto_dt == TRUE) ou um data.frame (se produto_dt = FALSE), padrao utilizado e FALSE}
}
\value{
Um data.frame com os dados do ministério da saúde de COVID 19
}
\description{
Recebe os dados no formato utilizado pelo ministerio da saude e limpa eles para o formato usado pelo boletim da codeplan na planilha de letalidade mortalidade
}
\examples{

}
