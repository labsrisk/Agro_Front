output$Download1 <- downloadHandler(filename = function(){
  glue("Planilha.xlsx")
}, function(file = "Downloads"){
  content = write.xlsx(x = Lista, file = file)
}
)

output$Tabela_Exemplo <- renderTable(expr = {
  Exemplo
})