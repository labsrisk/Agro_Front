ui <- shinyUI(
  ui = secure_app(ui = fluidPage( 
  #Passando Para O Header Algumas Intruções 'Globais' Para o HTML
  tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")),
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
             collapsible = TRUE,
             home,
             Ferramenta,
             Apoio
             
  ),
  
  #Footer
  div(class = "footer", includeHTML(path = "html/footer.html"))
), tags_top = tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "style_login.css")), language = "pt-BR", theme = shinytheme(theme = "cerulean"))) 