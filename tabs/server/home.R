observeEvent(input$Apoio, {
  updateTabsetPanel(session = session, inputId = "navbar", selected = "Apoio")
})

observeEvent(input$Ferramenta, {
  updateTabsetPanel(session = session, inputId = "navbar", selected = "Ferramenta")
})
