# CODEPLAN.BOLETIM

O pacote codeplan.boletim foi criado para automatizar o processo de geração do boletim codeplan referente ao COVID-19. A principal função do pacote é `gera_boletim()` que gera automaticamente o boletim. Outras funções são exportadas para a criação do pacote por partes.

## Processo de criação do boletim

O processo de criação do boletim é feito nas seguintes etapas.

1. Baixa os dados do ministério da saúde;
2. Limpa os dados;
3. Formata os dados para os diferentes formatos usados pelo boletim;
4. Gera gráficos.

## Exemplo

Começa o R numa estrutura de pasta no seguinte formato:

Projeto

├── dados/

├── produto/

Para gera o boletim pela primeira vez é necessário instalar o pacote.
```
devtools::install_github("mellohenrique/codeplan.boletim")
```

Após realizada a instalação roda-se:

```
library(codeplan.boletim)

gera_boletim()

```

Os resultados estarão na pasta produto e os dados brutos do ministério da saude estarão na pasta dados.
