#' ba_vendor_specifications
#'
#' Defines the plate format specification for the vendor.
#'
#' @param con list, brapi connection object
#' @param rclass character; default: "list" possible other values: "json"
#'
#' @return rclass as defined
#'
#' @author Reinhard Simon, Maikel Verouden
#' @references \href{https://github.com/plantbreeding/API/blob/V1.2/Specification/ExternalVendorSamples/Vendor_Specifications_GET.md}{github}
#'
#' @example inst/examples/ex-ba_vendor_specifications.R
#'
#' @export
ba_vendor_specifications <- function(con = NULL,
                       rclass = c("list", "json")) {
  ba_check(con = con, verbose = FALSE)
  rclass <- match.arg(rclass)

  callurl <- get_brapi(con) %>% paste0("vendor/specifications")

  tryCatch({
    resp <- brapiGET(url = callurl, con = con)
    cont <- httr::content(x = resp, as = "text", encoding = "UTF-8")

    out <- dat2tbl(cont, rclass, result_level = "result")
    if (!is.null(out)) {
      class(out) <- c(class(out), "ba_vendor_specifications")
    }
    return(out)
  })
}
