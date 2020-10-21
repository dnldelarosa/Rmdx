library(officedown)
library(flextable)
library(officer)
library(knitr)
library(kableExtra)
library(DT)
library(magrittr)
library(htmltools)



formato <- ifelse(
  is.null(knitr::opts_knit$get("rmarkdown.pandoc.to")[[1]]),
  'html',
  knitr::opts_knit$get("rmarkdown.pandoc.to")[[1]]
  )

include_conditional <- function(texto = NA_character_, header=1){
  if(is.na(texto)){
    if(formato %in% exclude_r_in){
      FALSE
    } else {
      TRUE
    }
  } else if(!(formato %in% exclude_r_in)) {
    paste0(rep('#', header), ' ', texto)
  }
}


tableD <- function(df, caption = " "){
  if(formato == 'latex'){
    kable(
      df,
      "latex",
      caption = caption,
      longtable = T,
      booktabs = T
      ) %>%
      kable_styling(
        latex_options = c("repeat_header")
        )
  } else if(formato == 'html'){
      datatable(df, caption = caption)
  } else {
    set_caption(flextable(df), caption = caption, autonum = run_autonum(pre_label = 'Tabla '))
  }
}

html_widget <- function(hw, name){
  if(formato == 'latex'){
    htmlwidgets::saveWidget(hw, paste0(name, '.html'))
    webshot::webshot(paste0(name, '.html'),
                     paste0(name, '.pdf'),
                     delay = 0.5)
    file.remove(paste0(name, '.html'))
    knitr::include_graphics(paste0(name, '.pdf'), auto_pdf = T)
  }else{
    hw
  }
}

knitr::opts_chunk$set(
  echo = include_conditional(),
  message = include_conditional(),
  comment = "",
  fig.align = 'center')
