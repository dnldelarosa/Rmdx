install_crender <- function(){
  tryCatch(
    do.call(library, list("remotes")),
    error = function(e){
      utils::install.packages('remotes')
      }
    )
  do.call(what = `::`, args = list("remotes", "install_github"))("drdsdaniel/crender")
}
