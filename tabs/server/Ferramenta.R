output$UI <- renderUI(expr = {
  sliderInput(inputId = "Break_Even", label = "Escolha Seu Break Even",
              min = 0, 
              max = round(x = input$Target, digits = 0),
              value = round(x = quantile(x = Dados$Valor, 0.3), digits = 0),
              step = 1, ticks = FALSE, post = "TCH")
})

output$Grafico <- renderPlot(expr = {
  Target <- input$Target
  Break_Even <- input$Break_Even
  
  Quebra <- sum(... = Tabela$PR_SIM < Break_Even)/nrow(x = Tabela)
  Delta <- sum(... = Tabela$PR_SIM >= Break_Even & Tabela$PR_SIM < Target)/nrow(x = Tabela)
  Positivo <- 1 - (Quebra + Delta)
  
  ggplot(data = Dados, aes(x = Valor, y = Dens)) +
    geom_area(data = subset(x = Dados, Valor < Break_Even), fill = "darkred", alpha = 0.65) +
    geom_area(data = subset(x = Dados, Valor >= Break_Even & Valor <= Target), fill = "yellow", alpha = 0.65) +
    geom_area(data = subset(x = Dados, Valor > Target), fill = "darkgreen", alpha = 0.65) +
    geom_line(size = 2) + scale_x_continuous(label = comma, expand = c(0,0), 
                                             breaks = c(round(x = as.numeric(x = quantile(x = Dados$Valor, c(0.3, 0.5, 0.7)))))) +
    scale_y_continuous(label = comma, expand = c(0,0)) +
    geom_text(label = glue("Risco Transferido (Regiao Vermelha): {round(x = Quebra * 100, digits = 2)}%"),
              aes(x = quantile(x = Valor, 0.8), y = quantile(x = Dens, 0.8)), size = 5) +
    geom_text(label = glue("Risco Retido (Regiao Amarela): {round(x = Delta * 100, digits = 2)}%"),
              aes(x = quantile(x = Valor, 0.8), y = quantile(x = Dens, 0.7)), size = 5) +
    geom_text(label = glue("Risco Positivo (Regiao Verde): {round(x = Positivo * 100, digits = 2)}%"),
              aes(x = quantile(x = Valor, 0.8), y = quantile(x = Dens, 0.6)), size = 5) + theme_classic(base_size = 16) +
    labs(title = "Grafico de Risco", y = "", x = "Produtividade Real Simulada", subtitle = glue("Corte Escolhido : {Corte_Escolhido}")) +
    theme(plot.title = element_text(hjust = 0.4, vjust = 2), axis.text = element_text(colour = "black"), 
          plot.subtitle = element_text(hjust = 0.4, vjust = 4), axis.ticks.y = element_blank(), axis.text.y = element_blank())
})


                    
