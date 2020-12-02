library(shiny)
server <- function(input, output, session) {
    require(diyabcGUI)
    diyabcGUI::diyabc_server(input, output, session)
}
