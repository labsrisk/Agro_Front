Dados <- reactive(x = {
  req(... = input$Base)
  Dados <- read_xlsx(path = glue("{input$Base$datapath}")) 
  Dados
})

Riscos <- reactive(x = {
  req(... = input$Base)
  Base <- F_Motor_Quant_Riscos(x = Dados(), Simu = 500) 
  Base
}) 

Exposicao <- reactive(x ={
  req(... = input$Base)
  Retorno <- EV_Total(x = Riscos())
  Retorno <- as.data.frame(x = Retorno)
  colnames(x = Retorno) <- "Valores"
  Retorno
})

output$Ranking_EV <- renderTable(expr = {
  req(... = Riscos())
  Temporario <- data.frame("ID" = rep(x = 0, times = nrow(x = Dados())), "Evento" = rep(x = 0, times =nrow(x = Dados())),
                           "EV_Esperado" = rep(x = 0, times =nrow(x = Dados())))
  
  for(i in 1:length(x = Riscos())){
    Temporario$Evento[i] <- Dados()$Evento_Risco[i]
    Temporario$ID[i] <- names(x = Riscos())[i]
    Temporario$EV_Esperado[i] <- mean(x = Riscos()[[i]]$Valor_Esperado)
  }
  
  Temporario <- Temporario[order(... = Temporario$EV_Esperado, decreasing = TRUE), ]
  Retorno <- Temporario[1:3, c("Evento", "EV_Esperado")]
  Retorno
}, caption = "Ranking Por Valor Esperado",caption.placement = getOption("xtable.caption.placement", "top"))

output$Ranking_Prob <- renderTable(expr = {
  req(... = Riscos())
  Retorno <-Dados()
  Retorno <- Retorno[order(... = Retorno$Probabilidade_Max, decreasing = TRUE),]
  Retorno <- Retorno[1:3, c("Evento_Risco", "Probabilidade_Max")]
  Retorno
}, caption = "Ranking Por Probabilidade", caption.placement = getOption("xtable.caption.placement", "top"))

output$Ranking_Impacto <- renderTable(expr = {
  req(... = Riscos())
  Retorno <-Dados()
  Retorno <- Retorno[order(... = Retorno$Impacto_Max, decreasing = TRUE),]
  Retorno <- Retorno[1:3, c("Evento_Risco", "Impacto_Max")]
  Retorno
}, caption = "Ranking Por Impacto", caption.placement = getOption("xtable.caption.placement", "top"))


output$Relatorio <- downloadHandler(
  filename = "Relatorio.html",
  content = function(file){
    tempReport <- file.path(tempdir(), "Relatorio.Rmd")
    file.copy("Relatorio.Rmd", tempReport, overwrite = TRUE)
    params <- list(n = Exposicao()) 
    rmarkdown::render(tempReport, output_file = file,
                      params = params,
                      envir = new.env(parent = globalenv()))
  })
                    
observeEvent(input$Resetar, {
  session$reload()
})