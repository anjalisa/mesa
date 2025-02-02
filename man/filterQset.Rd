% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dplyrVerbs.R
\name{filterQset}
\alias{filterQset}
\title{This function takes a qseaSet and filters the samples in it based on a call to dplyr::filter on the sampleTable.}
\usage{
filterQset(qseaSet, ...)
}
\arguments{
\item{qseaSet}{The qseaSet object.}

\item{...}{Other arguments to pass to dplyr::filter}
}
\value{
A qseaSet object with the sampleTable enhanced with the information on number of reads etc
}
\description{
This function takes a qseaSet and filters the samples in it based on a call to dplyr::filter on the sampleTable.
}
