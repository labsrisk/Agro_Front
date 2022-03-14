cores <- c("#098ebb", "#e96449")

Caixas_Texto_HTML <- readRDS(file = "C:/Users/wesleysilva/Desktop/Funções/Caixas_Texto_HTML.rds")
Paragrafo_HTML <- readRDS(file = "C:/Users/wesleysilva/Desktop/Funções/Paragrafo_HTML.rds")

Texto_1 <- "Ter informações nunca foi tão importante como nos dias de hoje. O acesso à informação, a conectividade entre as pessoas e as 
tecnologias emergentes são alguns dos principais aspectos que estão influenciando diretamente a forma como pensamos e agimos. No mundo dos negócios, 
a revolução digital e a indústria 4.0 são marcos de um novo mindset."

Texto_2 <- "Mas como transformar dados em estratégia na era da informação? O uso intensivo de ciência de dados tem nos ajudado a aprofundar conhecimento 
e propor soluções inteligentes para desafios complexos."

Texto_3 <- "O Risk Labs é o nosso laboratório direcionado para análise preditiva de riscos por meio de modelagem estatística a partir de tecnologias 
emergentes. Ao identificar padrões e correlações, nos ajuda a ter insights para gerir riscos com mais segurança e desempenho."

home <- tabPanel(title = "Home", 
         value = "home",
         br(), br(),
         h1("WELCOME TO VONORYS WEBPAGE"), 
         br(), br(), br(), br(),
         column(width = 6, align = "center",
                Caixas_Texto_HTML(texto = "Ferramenta", cor = cores[1], id = "Ferramenta")
         ),
         column(width = 6, align = "center",
                Caixas_Texto_HTML(texto = "Material Apoio", cor = cores[2], id = "Apoio")
         ),
         column(width = 12,
                br(), br(), br(), br(),
                wellPanel(
                  h1("RISK LABS"),
                  Paragrafo_HTML(texto = Texto_1, tamanho = 20),
                  Paragrafo_HTML(texto = Texto_2, tamanho = 20),
                  Paragrafo_HTML(texto = Texto_3, tamanho = 20)
                )
         )
)

saveRDS(object = home, file = "C:/Users/wesleysilva/Desktop/Projetos_Github/Agro_Front/tabs/ui/home.rds")