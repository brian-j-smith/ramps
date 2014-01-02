\name{NURE}
\docType{data}
\alias{NURE}
\alias{NURE.grid}

\title{Dataset of USGS NURE Uranium Measurements}

\description{
   Connecticut, USA, areal and point-source uranium measurements from the United States Geological Survey (USGS) National Uranium Resource Evaluation (NURE) project.
}

\usage{data(NURE)}

\format{
   The following variables are provided in the \code{NURE} data frame:
   \describe{
      \item{\code{ppm}}{uranium measurements in parts per million.}
      \item{\code{measurement}}{type of measurement: 1 = areal, 2 = point-source.}
      \item{\code{lon}}{longitude coordinates of point-source measurements.}
      \item{\code{lat}}{latitude coordinates of point-source measurements.}
      \item{\code{easting}}{Universal Transverse Mercator easting coordinates - projected distances from the central meridian.}
      \item{\code{northing}}{Universal Transverse Mercator northing coordinates - projected distances from the equator.}
      \item{\code{county}}{counties from which measurements were taken.}
      \item{\code{area}}{county land mass areas in square miles.}
      \item{\code{id}}{unique identifiers for measured counties or sites.}
   }
   A grid of coordinates is provided by the \code{NURE.grid} data frame to facilitate Monte Carlo integration in geostatistical modeling of areal measurements.  The included columns are 
   \describe{
      \item{\code{lon}}{longitude coordinates of grid sites.}
      \item{\code{lat}}{latitude coordinates of grid sites.}
      \item{\code{id}}{county identifiers.}
   }
   Areal measurements in \code{NURE} can be matched to the grid coordinates in \code{NURE.grid} via the shared \code{"id"} variable.
}

\references{
   Duval, J.S., Jones, W.J., Riggle, F.R., and Pitkin, J.A. (1989) \dQuote{Equivalent uranium map of conterminous United States}, USGS Open-File Report 89-478.

   Smith, S.M.(2006) \dQuote{National Geochemical Database Reformatted Data from the National Uranium Resource Evaluation (NURE) Hydrogeochemical and Stream Sediment Reconnaissance (HSSR) Program}, USGS Open-File Report 97-492.
}

\examples{
data(NURE)

## Map areal and point-source measurements
ppm1 <- NURE$ppm[NURE$measurement == 1]
level <- (max(ppm1) - ppm1) / diff(range(ppm1))
map("county", "connecticut", fill = TRUE, col = gray(level))
title("Connecticut Uranium Measurements")
points(NURE$lon, NURE$lat)

## Map grid sites
map("county", "connecticut")
title("Regular Grid of Coordinates")
points(NURE.grid$lon, NURE.grid$lat)
}

\keyword{datasets}
