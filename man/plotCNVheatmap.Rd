% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/qseaCNV.R
\name{plotCNVheatmap}
\alias{plotCNVheatmap}
\title{This function takes a qseaSet and plots a heatmap of the calculated CNV}
\usage{
plotCNVheatmap(
  qseaSet,
  ...,
  annotationCol = NULL,
  annotationColors = NA,
  clusterRows = TRUE
)
}
\arguments{
\item{qseaSet}{The qseaSet object.}

\item{...}{A list of columns to use to annotate the samples with.}

\item{annotationCol}{A data frame with annotations for the samples (can be made with getAnnotationDataFrameIndividual)}

\item{annotationColors}{A list with the colours to use for the column legend, to pass to pheatmap}

\item{clusterRows}{Whether to cluster the rows of the heatmap}
}
\value{
A heatmap with the calculated number of chromosomes for each samples
}
\description{
This function takes a qseaSet and plots a heatmap of the calculated CNV
}
