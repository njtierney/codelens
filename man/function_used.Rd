% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/function_used.R
\name{function_used}
\alias{function_used}
\title{Return functions used and which line in a given file}
\usage{
function_used(path)
}
\arguments{
\item{path}{file path}
}
\value{
data frame of start line, function name, and path
}
\description{
Return functions used and which line in a given file
}
\examples{
\dontrun{
function_used("inst/test-fun.R")
}
}
