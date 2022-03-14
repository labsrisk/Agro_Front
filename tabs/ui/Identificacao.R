library(package = glue)
library(package = shiny)

Funcao_H1 <- readRDS(file = "C:/Users/wesleysilva/Desktop/Funções/Funcao_H1.rds")
Paragrafo_HTML <- readRDS(file = "C:/Users/wesleysilva/Desktop/Funções/Paragrafo_HTML.rds")

Texto_1 <- "Para começarmos, carregue o seu registro de risco abaixo com o template adequado. Se não souber qual 
                            template utilizar, visite nossa página inicial para maiores explicações sobre a planilha de apoio e 
                            baixe-a caso ainda não tenha efetuado esse passo."

Tamanho_Titulos <- 30
Tamanhos_Paragrafos <- 17

Identificacao <- tabPanel(title = "Identificacao",
                          fluidPage(
                            br(), br(),
                            wellPanel(Funcao_H1(texto = "Escolha Sua Base De Dados", tamanho = Tamanho_Titulos)),
                            Paragrafo_HTML(texto = Texto_1, tamanho = Tamanhos_Paragrafos),
                            br(),
                            fileInput(inputId = "Base", label = "Carregue Aqui Seu Registro de Risco", buttonLabel = "Escolher Arquivo", 
                                      placeholder = "Aguardando", accept = ".xlsx"),
                            conditionalPanel(condition = "output.Ranking_EV",
                                             actionButton(inputId = "Resetar", label = "Refazer Simulação"),
                            ),
                            conditionalPanel(condition="$('html').hasClass('shiny-busy')",
                                             tags$div("Por Favor, aguarde o processamento! Isso Pode Levar Alguns Minutos...",
                                                      id="Mensagem_Carregamento")),
                            conditionalPanel(condition = "output.Ranking_EV",
                                             Funcao_H1(texto = "TOP Riscos", tamanho = Tamanho_Titulos),
                                             hr(),
                                             br(),
                                           ),
                            fluidRow(
                                column(width = 4, tableOutput(outputId = "Ranking_EV")),
                                column(width = 4, tableOutput(outputId = "Ranking_Prob")),
                                column(width = 4, tableOutput(outputId = "Ranking_Impacto"))),
                            conditionalPanel(condition = "output.Ranking_EV",
                                             downloadButton(outputId = "Relatorio", label = "Baixar Relatório Técnico"),
                            )
                          ) 
                     )

saveRDS(object = Identificacao, file = "C:/Users/wesleysilva/Desktop/Identificação/tabs/ui/Identificacao.rds")
