valid_form_inf <- function(){
  c("title", "language",
    "created", "modified", "opened",
    "respondents", "contact","codebook",
    "personal_data", "sensitive_data",
    "editors", "elements")
}

#' @importFrom rvest html_text
#' @importFrom xml2 read_html
strip_html <- function(s) {
  ifelse(
    !is.na(s),
    gsub("\\\n|\\\t", "", html_text(read_html(s))),
    NA_character_
  )
}

max_selected <- function(x){
  t <- x$maxSelectedAnswerOptions
  ifelse(t == 0, NaN, t)
}

check_element <- function(x){
  if(length(x) == 1)
    return(x)

  NULL
}

#' @importFrom stats setNames
validate_information <- function(information) {

  inf_nms <- if(is.null(names(information))){
    information
  }else{
    names(information)
  }

  setNames(match.arg(unlist(information),
                     info(),
                     several.ok = TRUE),
           inf_nms)
}

info <- function(){
  c("order", "option",
    "correct", "preselected")
}

rn_cols <- function(x, from, to){
  gsub(paste0(from, "$"), to, x)
}

get_renv_path <- function(type = c("user", "project"),
                          envvar = "R_ENVIRON_USER"){
  envvar <- Sys.getenv(envvar)

  if(envvar != "") return(envvar)

  type <- match.arg(type, c("user", "project"))

  type <- switch(type,
                 "user" = Sys.getenv("HOME"),
                 "project" = here::here()
  )

  file.path(file.path(type, ".Renviron"))
}


#' Check if form has codebook
#'
#' Codebook is by default turned off
#' in Nettskjema, but best practices in handling
#' data is to have it on. This function
#' checks if the codebook of a form has been activated
#' or not
#'
#' @template form_id
#'
#' @return logical is codebook is turned on
#' @export
#'
#' @examples
#' \dontrun{
#' has_codebook(110000)
#' }
has_codebook <- function(form_id){
  nettskjema_get_meta(form_id)$codebook
}

rm_ext <- function(file){
  ex <- strsplit(file, split="\\.")[[1]]
  ex <- ex[-length(ex)]
  paste0(ex, collapse = ".")
}

## quiets concerns of R CMD check
if(getRversion() >= "2.15.1"){
  utils::globalVariables(c("question_codebook","cb", "question", "answer", "columns",
                           "string", "value",
                           "form_id", "element_no", "submission_id"))
}
