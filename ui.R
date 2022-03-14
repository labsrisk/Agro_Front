ui <- shinyUI(ui = fluidPage( 
  #Passando Para O Header Algumas Intruções 'Globais' Para o HTML
  tags$head(tags$link(rel = "stylesheet", type  = "text/css", 
                      href = "https://fonts.googleapis.com/css?family=Open+Sans|Source+Sans+Pro"),
            tags$link(rel="stylesheet", type = "text/css",
                      href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"),
            tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")
  ),
  #Logo Da Empresa Que Irá Aparecer Na Barra Do Navegador
  list(tags$head(HTML('<link rel="icon", href ="img/logo.png",
                      type = "image/png" />'))),
  
  #Titulo Que Aparece Na Barra Do Navegador
  titlePanel(title = "", windowTitle = "Horiens"),
  
  #HEADER
  #Logo Da Empresa Que Irá Aparecer Na Página HTML É O Argumento Passado Para O Título.
  navbarPage(title = div(img(src = "https://www.horiens.com/app/themes/ocs/dist/static/horiens_mascara-dda2790c7b.svg", 
                             heigth = "40px", width = "200px"), style = "padding-left: 50px;"),
             windowTitle = "",
             id = "navbar",
             selected = "home", 
             fluid = TRUE,
             collapsible = FALSE,
             home,
             Identificacao,
             Apoio,
             
  ),
  
  #Footer
  div(class = "footer", includeHTML(path = "html/footer.html"))
)) 