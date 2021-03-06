#' ba_samples_search
#'
#' Used to retrieve list of Samples from a Sample Tracking system based on some search criteria.
#'
#' @note Tested against: BMS
#'
#' @param con brapi connection object
#' @param sampleDbId character, default ''
#' @param observationUnitDbId character, default ''
#' @param plateDbId character, default ''
#' @param germplasmDbId character, default ''
#' @param pageSize integer,default 1000
#' @param page integer, default 0
#' @param rclass character; default: "tibble" possible other values: "json"/"list"/"data.frame"
#'
#' @return rclass as defined
#'
#' @author Reinhard Simon, Maikel Verouden
#' @references \href{https://github.com/plantbreeding/API/blob/V1.2/Specification/Samples/SampleSearch_GET.md}{github}
#'
#' @family phenotyping
#'
#' @example inst/examples/ex-ba_samples_search.R

#' @import tibble
#' @export
ba_samples_search <- function(con = NULL,
                              sampleDbId = "",
                              observationUnitDbId = "",
                              plateDbId = "",
                              germplasmDbId = "",
                              pageSize = 1000,
                              page = 0,
                              rclass = c("tibble", "data.frame",
                                         "list", "json")) {
  ba_check(con = con, verbose = FALSE)
  check_character(sampleDbId, observationUnitDbId, plateDbId, germplasmDbId)
  rclass <- match.arg(rclass)

  brp <- get_brapi(con) %>% paste0("samples-search")
  callurl <- get_endpoint(brp,
                          sampleDbId = sampleDbId,
                          observationUnitDbId = observationUnitDbId,
                          plateDbId = plateDbId,
                          germplasmDbId = germplasmDbId,
                          pageSize = pageSize,
                          page = page)

  tryCatch({
    resp <- brapiGET(url = callurl, con = con)
    cont <- httr::content(x = resp, as = "text", encoding = "UTF-8")

    out <- dat2tbl(res = cont, rclass = rclass)
    class(out) <- c(class(out), "ba_samples_search")

    return(out)
  })
}
