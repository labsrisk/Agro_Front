cores <- c("#098ebb", "#fdc23a", "#e96449", "#818286")

Caixas_Texto_HTML <- readRDS(file = "C:/Users/wesleysilva/Desktop/Funções/Caixas_Texto_HTML.rds")
Funcao_H1 <- readRDS(file = "C:/Users/wesleysilva/Desktop/Funções/Funcao_H1.rds")
Paragrafo_HTML <- readRDS(file = "C:/Users/wesleysilva/Desktop/Funções/Paragrafo_HTML.rds")

Texto_1 <- "O Risk Labs é o nosso laboratório direcionado para análise preditiva de 
riscos por meio de modelagem estatística a partir de tecnologias emergentes. Ao identificar padrões e 
correlações, nos ajuda a ter insights para gerir riscos com mais segurança e desempenho."

home <- tabPanel(title = "Home", 
         value = "home",
         br(), br(),
         Funcao_H1(texto = "WELCOME TO VONORYS WEBPAGE", tamanho = 30), 
         br(), br(), br(), br(),
         column(width = 6, align = "center",
                Caixas_Texto_HTML(texto = "Identificação e Análise", cor = cores[1], icon = "flag.png", id = "Identificacao")
         ),
         column(width = 6, align = "center",
                Caixas_Texto_HTML(texto = "Material Apoio", cor = cores[3], icon = "flag.png", id = "Apoio")
         ),
         column(width = 12,
                br(), br(), br(), br(),
                wellPanel(
                  Funcao_H1(texto = "RISK LABS", tamanho = 30),
                  Paragrafo_HTML(texto = Texto_1, tamanho = 20)
                )
         )
)

saveRDS(object = home, file = "C:/Users/wesleysilva/Desktop/Identificação/tabs/ui/home.rds")