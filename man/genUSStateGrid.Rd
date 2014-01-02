\name{genUSStateGrid}
\alias{genUSStateGrid}

\title{ Generating a Grid over a US State }

\description{
  This function generate a grid of points over a US state with given
  increment size or resolution.
}

\usage{
   genUSStateGrid(state, incr = NULL, resolution = NULL)
}

\arguments{
  \item{state}{ the name of a US state. }
  \item{incr}{ a numeric vector of length 2 specifying the increment in
    longitude and latitude. }
  \item{resolution}{ a numeric vector of length 2 specifying the size of
    the grid in longitude and latitude. }
}

\value{
  A data.frame:
  \item{lon}{longitude of the grid point.}
  \item{lat}{latitude of the grid point.}
  \item{id}{the id number of the county in which the grid point is located.}
  \item{county}{the name of the county in which the grid point is located.}
}

\author{
  Jun Yan \email{jun.yan@uconn.edu}
}

\seealso{
  \code{\link{genUSStateSites}}
}

\examples{
mygrid <- genUSStateGrid('iowa', resolution=c(8, 4))
map('state', 'iowa')
points(mygrid)
}

\keyword{datagen}
\keyword{utilities}
