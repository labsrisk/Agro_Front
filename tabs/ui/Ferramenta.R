library(package = glue)
library(package = shiny)

Paragrafo_HTML <- readRDS(file = "C:/Users/wesleysilva/Desktop/Funções/Paragrafo_HTML.rds")

Texto_1 <- "Para começarmos, carregue o seu registro de risco abaixo com o template adequado. Se não souber qual 
                            template utilizar, visite nossa página inicial para maiores explicações sobre a planilha de apoio e 
                            baixe-a caso ainda não tenha efetuado esse passo."


Tamanhos_Paragrafos <- 17

Ferramenta <- tabPanel(title = "Ferramenta",
                          fluidPage(
                            br(), br(),
                            wellPanel(h1("Escolha Sua Base De Dados")),
                            Paragrafo_HTML(texto = Texto_1, tamanho = Tamanhos_Paragrafos),
                            br(),
                            sidebarLayout(sidebarPanel(sliderInput(inputId = "Target", label = "Escolha Sua Produção Desejável",
                                                                   min = 0,
                                                                   max = round(x = max(... = Dados$Valor), digits = 0),
                                                                   value = round(x = quantile(x = Dados$Valor, 0.6), digits = 0),
                                                                   step = 1, ticks = FALSE, post = "TCH"),
                                                       uiOutput(outputId = "UI")),
                                                       mainPanel(plotOutput(outputId = "Grafico")))
                          ) 
                     )

saveRDS(object = Ferramenta, file = "C:/Users/wesleysilva/Desktop/Projetos_Github/Agro_Front/tabs/ui/Ferramenta.rds")
