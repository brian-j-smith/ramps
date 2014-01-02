\name{corRExpwr2}
\alias{corRExpwr2}

\title{Non-Separable Powered Exponential Spatio-Temporal Correlation Structure}

\description{
   This function is a constructor for the \code{'corRExpwr2'} class, representing a non-separable spatial correlation structure. Letting \eqn{rs} denote the spatial range, \eqn{ps} the spatial shape, \eqn{rt} the temporal range, \eqn{pt} the temporal shape, and \eqn{lambda} the space-time interaction, the correlation between two observations a distance \eqn{d} apart in space and \eqn{t} in time is \eqn{\exp(-(d/rs)^ps - (t/rt)^pt - \lambda (d/rs)^ps (t/rt)^pt)}{exp(-(d/rs)^ps - (t/rt)^pt - lambda * (d/rs)^ps * (t/rt)^pt)}.
}

\usage{
   corRExpwr2(value = numeric(0), form = ~ 1,
              metric = c("euclidean", "maximum", "manhattan", "haversine"),
              radius = 3956)
}

\arguments{
   \item{value}{optional numeric vector of five parameter values for the powered exponential correlation structure, corresponding to the \dQuote{spatial range}, \dQuote{spatial shape}, \dQuote{temporal range}, \dQuote{temporal shape}, and \dQuote{space-time interaction}.  The range parameter values must be greater than zero, the shapes in the interval (0, 2], and the interaction greater than or equal to zero.  Defaults to \code{numeric(0)}, which results in ranges of 90\% of the minimum distances, shapes of 1, and an interaction of 0 being assigned to the parameters when \code{object} is initialized.}

   \item{form}{one-sided formula of the form \code{~ S1+...+Sp+T}, specifying spatial covariates \code{S1} through \code{Sp} and the times \code{T} at which measurement were taken.}

   \item{metric}{optional character string specifying the distance metric to be used. The currently available options are \code{"euclidean"} for the root sum-of-squares of distances;   \code{"maximum"} for the maximum difference; \code{"manhattan"} for the sum of the absolute differences; and \code{"haversine"} for the great-circle distance (miles) between longitude/latitude coordinates. Partial matching of arguments is used, so only the first three characters need to be provided. Defaults to \code{"euclidean"}.}

   \item{radius}{radius to be used in the haversine formula for great-circle distance.  Defaults to the Earth's radius of 3,956 miles.}
}

\note{
   When \code{"haversine"} is used as the distance metric, longitude and latitude coordinates must be given as the first and second covariates, respectively, in the formula specification for the \code{form} argument.
}

\value{
   Object of class \code{'corRExpwr2'}, inheriting from class \code{'corSpatioTemporal'}, representing a non-separable spatial correlation structure.
}

\references{
   Cressie, N. and Huang, H.-C. (1993) \dQuote{Classes of Nonseperable, Spatio-Temporal Stationary Covariance Functions}, \emph{Journal of the American Statistical Association}, 94, 1330-1340.

   Gneiting, T. (2002) \dQuote{Nonseparable, stationary covariance functions for space-time data}, \emph{Journal of the American Statistical Association}, 97, 590-600.
}

\author{
   Brian Smith \email{brian-j-smith@uiowa.edu}
}

\seealso{
   \code{\link{corClasses}},
   \code{\link[nlme]{Initialize.corStruct}},
   \code{\link[nlme]{summary.corStruct}}
}

\examples{
sp1 <- corRExpwr2(form = ~ x + y + t)

spatDat <- data.frame(x = (0:4)/4, y = (0:4)/4, t=(0:4)/4)

cs1Expwr <- corRExpwr2(c(1, 1, 1, 1, 1), form = ~ x + y + t)
cs1Expwr <- Initialize(cs1Expwr, spatDat)
corMatrix(cs1Expwr)

cs2Expwr <- corRExpwr2(c(1, 1, 1, 1, 1), form = ~ x + y + t, metric = "man")
cs2Expwr <- Initialize(cs2Expwr, spatDat)
corMatrix(cs2Expwr)
}

\keyword{models}
