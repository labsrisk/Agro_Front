library(package = glue)

Funcao_H1 <- readRDS(file = "C:/Users/wesleysilva/Desktop/Funções/Funcao_H1.rds")
Paragrafo_HTML <- readRDS(file = "C:/Users/wesleysilva/Desktop/Funções/Paragrafo_HTML.rds")

Texto_1 <- "A padronização das informações essenciais que devem constar no Registro de Risco se faz necessária para que todos os envolvidos no processo de 
análise de riscos consigam se comunicar de forma mais eficiente. Para conseguir tal objetivo disponibilizamos a planilha padrão para download, onde na guia
de sumário o usuário irá encontrar descrições de cada coluna e definições de conceitos para que auxilia-lo no preenchimento adequado do documento."
Texto_2 <- "Ademais, com o intuito de sanar qualquer dúvida quanto a maneira correta de preenchimento, consta abaixo um registro de risco fictício 
completamente preenchido."

Tamanho_Paragrafos <- 20
Tamanho_Titulos <- 30

Apoio <- tabPanel(title = "Apoio", 
                      fluidPage(
                        br(), br(),
                        wellPanel(Funcao_H1(texto = "Material de Apoio - Planilha Padronizada", tamanho = Tamanho_Titulos)),
                        Paragrafo_HTML(texto = Texto_1, tamanho = Tamanho_Paragrafos),
                        Paragrafo_HTML(texto = Texto_2, tamanho = Tamanho_Paragrafos),
                        downloadButton(outputId = "Download1", label = "Baixar_Planilha"),
                        br(), br(),
                        Funcao_H1(texto = "Planilha Preenchida - Exemplo Fícticio", tamanho = Tamanho_Titulos),
                        hr(),
                        tableOutput(outputId = "Tabela_Exemplo")
                      )
         )

saveRDS(object = Apoio, file = "C:/Users/wesleysilva/Desktop/Identificação/tabs/ui/Apoio.rds")