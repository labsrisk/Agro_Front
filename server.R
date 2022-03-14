server <- shinyServer(function(input, output, session){
  source(file = "tabs/server/Identificacao.R", local = TRUE)
  source(file = "tabs/server/home.R", local = TRUE)
  source(file = "tabs/server/Apoio.R", local = TRUE)
})
