% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_summarise.R
\name{plot_summarise}
\alias{plot_summarise}
\title{Summarize forest inventory data}
\usage{
plot_summarise(
  df,
  plot,
  plot_area,
  dbh,
  th,
  .groups,
  total_area,
  vwb,
  vwob,
  dh,
  age,
  dec_places = 4
)
}
\arguments{
\item{df}{A data frame.}

\item{plot}{Quoted name of the plot variable. used to differentiate the data's plots. If this argument is missing, the defined groups in the data frame will be used, If there are no groups in the data, the function will fail.}

\item{plot_area}{Quoted name of the plot area variable, or a numeric vector with the plot area value. The plot area value must be in square meters.}

\item{dbh}{Optional parameter. Quoted name of the diameter at breast height variable. If supplied, will be used to calculate the mean diameter per plot, quadratic diameter (q), basal area and basal area per hectare. Default \code{NA}.}

\item{th}{Optional parameter. Quoted name of the total height variable. If supplied, will be used to calculate the mean total height, and the dominant height variable, if the \code{dh} is \code{NA}. Default \code{NA}.}

\item{.groups}{Optional argument. Quoted name(s) of grouping variables that can be added to differentiate subdivisions of the data. Default: \code{NA}.}

\item{total_area}{Optional argument. Quoted name of the total area variable, or a numeric vector with the total area value. The total area value must be in hectares. Default: \code{NA}.}

\item{vwb}{Optional parameter. Quoted name of the volume with bark variable. If supplied, will be used to calculate the total vwb per plot, and vwb per hectare per plot. Default \code{NA}.}

\item{vwob}{Optional parameter. Quoted name of the volume without bark variable. If supplied, will be used to calculate the total vwob per plot, and vwob per hectare per plot. Default \code{NA}.}

\item{dh}{Optional parameter. Quoted name of the dominant height variable. If supplied, will be used to calculate the mean dominant height per plot. If not, the \code{ht} variable supplied will be used to calculate the average of the top two trees of each plot, and use that as dh. Default: \code{NA}.}

\item{age}{Optional parameter. Quoted name of the age variable. If supplied, will be used to calculate the average age per plot. Default: \code{NA}.}

\item{dec_places}{Numeric value for the number of decimal places to be used in the output tables. Default: \code{4}.}
}
\value{
A data frame with informations per plot.
}
\description{
Get informations about forest inventory plots, like number of individuals,
mean DBH, q, height, basal area, volume, etc.
}
\examples{
library(forestmangr)
data("exfm21")
head(exfm21)

# Obligatory arguments. Basic informations about the plot.
plot_summarise(exfm21, "PLOT", 810)

# Area values can be numeric, or a variable name
plot_summarise(exfm21, "PLOT", "PLOT_AREA")

# With DBH supplied, we get the mean diameter, quadratic diameter,
# basal area and basal area per hectare:
plot_summarise(exfm21, "PLOT", "PLOT_AREA", "DBH")

# With TH supplied, we get the mean total height and dominant height
plot_summarise(exfm21, "PLOT", "PLOT_AREA", "DBH", "TH_EST")

# With strata supplied, we divide the data into 2 strata
plot_summarise(exfm21, "PLOT", "PLOT_AREA", "DBH", "TH_EST", "STRATA")

# The strata area can also be supplied
plot_summarise(exfm21, "PLOT", "PLOT_AREA", "DBH", "TH_EST", "STRATA", "STRATA_AREA")

# With VWB supplied, we get the total vwb, and vwb per hectare
plot_summarise(exfm21, "PLOT", "PLOT_AREA", "DBH", "TH_EST", "STRATA", "STRATA_AREA",
 "VWB")

# With VWOB supplied, we get the total vwob, and vwob per hectare
plot_summarise(exfm21, "PLOT", "PLOT_AREA", "DBH", "TH_EST", "STRATA", "STRATA_AREA",
 "VWB", "VWOB")

# If the data already has a dominant height variable, it can also be supplied here
plot_summarise(exfm21, "PLOT", "PLOT_AREA", "DBH", "TH_EST", "STRATA", "STRATA_AREA",
 "VWB", "VWOB", "DH")

# With the AGE variable supplied, we get the average age of each plot
plot_summarise(exfm21, "PLOT", "PLOT_AREA", "DBH", "TH_EST", "STRATA", "STRATA_AREA",
 "VWB", "VWOB", "DH", "AGE")

}
\author{
Sollano Rabelo Braga \email{sollanorb@gmail.com}
}
