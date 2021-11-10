library(shiny)
library(bs4Dash)
library(waiter)
library(shinyjs)

shinyApp(
  
  ui = dashboardPage(
    title = "Basic Dashboard",
    preloader = list(html = tagList(spin_6(), "Loading ..."), color = "#3c8dbc"),
    header = dashboardHeader(
      title = dashboardBrand(
        title = "bs4Dash",
        color = "primary",
        href = "https://adminlte.io/themes/v3",
        image = "https://adminlte.io/themes/v3/dist/img/AdminLTELogo.png"
      )
    ),
    sidebar = dashboardSidebar(
      sidebarMenu(
        id = "sidebarmenu",
        sidebarHeader("Menu"),
        menuItem(
          "Item 1",
          tabName = "item1",
          icon = icon("home")
        ),
        menuItem(
          "Item 2",
          tabName = "item2",
          icon = icon("chart-line"),
          startExpanded = TRUE,
          menuSubItem(
            text = "Sub item 1",
            tabName = "subitem1",
            icon = icon("chart-area")
          ),
          menuSubItem(
            text = "Sub item 2",
            tabName = "subitem2",
            icon = icon("chart-bar")
          )
        )
      )
    ),
    controlbar = dashboardControlbar(
      controlbarMenu(
        id = "controlbarmenu",
        type = "pills",
        controlbarItem(
          title = "Item 1",
          radioButtons(
            inputId = "radio1",
            label = "Make a choice",
            choices = c("Choice 1", "Choice 2")
          ),
          selectInput(
            inputId = "selectinput1",
            label = "Select something",
            choices = c("Choice 1", "Choice 2")
          )
        ),
        controlbarItem(
          title = "Skin selector",
          div(class = "p-3", skinSelector())
        )
      )
    ),
    footer = dashboardFooter(
      left = a(
        href = "https://rinterface.github.io/bs4Dash/",
        target = "_blank", "bs4Dash"
      ),
      right = "2021"
    ),
    body = dashboardBody(
      
      useShinyjs(),
      
      accordion(
        id = "accordion1",
        accordionItem(
          title = "Accordion 1 Item 1",
          status = "primary",
          collapsed = TRUE,
          "This is some text!"
        ),
        accordionItem(
          title = "Accordion 1 Item 2",
          status = "warning",
          collapsed = FALSE,
          "This is some text!"
        )
      ),
      
      fluidRow(
        box(
          title = "Closable Box with dropdown",
          closable = TRUE,
          width = 12,
          height = 500,
          status = "warning",
          solidHeader = FALSE,
          collapsible = TRUE,
          label = boxLabel(
            text = 'new',
            status = "danger"
          ),
          dropdownMenu = boxDropdown(
            boxDropdownItem("Link to google", href = "http://www.google.com"),
            boxDropdownItem("item 2", href = "#")
          ),
          sidebar = boxSidebar(
            startOpen = FALSE,
            id = "mycardsidebar",
            sliderInput(
              inputId = "sliderinput",
              label = "Number of observations:",
              min = 0,
              max = 1000,
              value = 500
            )
          )
        )
      )
    )
  ),
  server = function(input, output, session) {
    # hide pre-loader
    shinyjs::delay(2000, {
      waiter_hide()
    })
  }
)