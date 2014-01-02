\name{simJSS}
\docType{data}
\alias{simJSS}
\alias{simIowa}
\alias{simGrid}

\title{Dataset of Simulated Measurements from JSS Publication}

\description{
   Simulated Iowa, USA, areal and point-source measurements analyzed in the Working Example of the ramps package paper published in \emph{Journal of Statistical Software}.
}

\usage{data(simJSS)}

\format{
   The following variables are provided in the \code{simIowa} data frame:
   \describe{
      \item{\code{areal}}{type of measurement: 1 = areal, 0 = point-source.}
      \item{\code{y}}{simulated measurement.}
      \item{\code{id}}{unique identifiers for measurements.}
      \item{\code{siteId}}{unique identifiers for point-source measurement sites.}
      \item{\code{lon}}{longitude coordinates of point-source measurements.}
      \item{\code{lat}}{latitude coordinates of point-source measurements.}
      \item{\code{weights}}{number of sites per measurement.}
   }
   A grid of coordinates is provided by the \code{simGrid} data frame to facilitate Monte Carlo integration in geostatistical modeling of areal measurements.  The included columns are
   \describe{
      \item{\code{lon}}{longitude coordinates of grid sites.}
      \item{\code{lat}}{latitude coordinates of grid sites.}
      \item{\code{id}}{county identifiers.}
      \item{\code{county}}{county names.}
   }
   Areal measurements in \code{simIowa} can be matched to the grid coordinates in \code{simGrid} via the shared \code{"id"} variable.
}

\details{
   Areal and point-source observations were generated from from a geostatistical model using the county structure in the state of Iowa, USA.  There are 99 counties in the state.  Areal observations were generated from each as county averages from a uniform grid of 391 sites - approximately 4 sites per county.  An additional 600 point-source observations were generated from a set of 300 unique sites sampled from a uniform distribution in Iowa.

   An exponential correlation structure with a range parameter of 10 was used for the underlying Gaussian spatial structure.  Measurement errors were generated with variances of 0.25 for point-source data and 0.09 for areal data.  Site-specific non-spatial random effects were generated with a variance 0.16.  One fixed effects covariate with coefficient equal to 0.5 was included as an indicator for areal observations.
}

\references{
   Smith, B. J., Yan, J., and Cowles, M. K. (2008) \dQuote{Unified Geostatistical Modeling for Data Fusion and Spatial Heteroskedasticity with R Package ramps}, \emph{Journal of Statistical Software}, 25(10), 1-21.
}

\examples{
data(simJSS)

## Map areal and point-source measurements
y <- simIowa$y[simIowa$areal == 1]
level <- (max(y) - y) / diff(range(y))
map("county", "iowa", fill = TRUE, col = gray(level))
title("Simulated Iowa Measurements")
points(simIowa$lon, simIowa$lat)

## Map grid sites
map("county", "iowa")
title("Regular Grid of Coordinates")
points(simGrid$lon, simGrid$lat)
}

\keyword{datasets}
