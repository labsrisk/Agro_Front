
observeEvent(input$Planilhas, {
  updateTabsetPanel(session = session, inputId = "navbar", selected = "Planilhas") 
})

observeEvent(input$Apoio, {
  updateTabsetPanel(session = session, inputId = "navbar", selected = "Apoio")
})

observeEvent(input$Ferramenta, {
  updateTabsetPanel(session = session, inputId = "navbar", selected = "Ferramenta")
})

observeEvent(input$Identificacao, {
  updateTabsetPanel(session = session, inputId = "navbar", selected = "Identificacao") 
})