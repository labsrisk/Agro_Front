server <- shinyServer(function(input, output, session){
  source(file = "tabs/server/Ferramenta.R", local = TRUE)
  source(file = "tabs/server/home.R", local = TRUE)
  source(file = "tabs/server/Apoio.R", local = TRUE)
  
  result_auth <- secure_server(check_credentials = check_credentials(db = Credenciais), timeout = 5)
})
