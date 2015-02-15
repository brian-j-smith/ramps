\name{corRExpwr2Dt}
\alias{corRExpwr2Dt}

\title{Non-Separable Temporally Integrated Powered Exponential Spatial Correlation Structure}

\description{
   This function is a constructor for the \code{'corRExpwr2Dt'} class, representing a non-separable spatial correlation structure for temporally integrated measurements. Letting \eqn{rs} denote the spatial range, \eqn{ps} the spatial shape, \eqn{rt} the temporal range, and \eqn{lambda} the space-time interaction, the correlation between two observations a distance \eqn{d} apart in space and \eqn{t} in time is \eqn{\exp(-(d/rs)^ps - t/rt - \lambda (d/rs)^ps (t/rt))}{exp(-(d/rs)^ps - t/rt - lambda * (d/rs)^ps * (t/rt))}.
}

\usage{
   corRExpwr2Dt(value = numeric(0), form = ~ 1,
                metric = c("euclidean", "maximum", "manhattan", "haversine"),
                radius = 3956)
}

\arguments{
   \item{value}{optional numeric vector of four parameter values for the powered exponential correlation structure, corresponding to the \dQuote{spatial range}, \dQuote{spatial shape}, \dQuote{temporal range}, and \dQuote{space-time interaction}.  The range parameter values must be greater than zero, the shape in the interval (0, 2], and the interaction greater than or equal to zero.  Defaults to \code{numeric(0)}, which results in ranges of 90\% of the minimum distances, a shape of 1, and an interaction of 0 being assigned to the parameters when \code{object} is initialized.}

   \item{form}{one-sided formula of the form \code{~ S1+...+Sp+T1+T2}, specifying spatial covariates \code{S1} through \code{Sp} and the times \code{(T1, T2)} at which measurement periods begin and end, respectively.}

   \item{metric}{optional character string specifying the distance metric to be used. The currently available options are \code{"euclidean"} for the root sum-of-squares of distances;   \code{"maximum"} for the maximum difference; \code{"manhattan"} for the sum of the absolute differences; and \code{"haversine"} for the great-circle distance (miles) between longitude/latitude coordinates. Partial matching of arguments is used, so only the first three characters need to be provided. Defaults to \code{"euclidean"}.}

   \item{radius}{radius to be used in the haversine formula for great-circle distance.  Defaults to the Earth's radius of 3,956 miles.}
}

\note{
   When \code{"haversine"} is used as the distance metric, longitude and latitude coordinates must be given as the first and second covariates, respectively, in the formula specification for the \code{form} argument.
}

\value{
   Object of class \code{'corRExpwr2Dt'}, also inheriting from class \code{'corSpatial'}, representing a non-separable spatial correlation structure.
}

\references{
   Cressie, N. and Huang, H.-C. (1993) \dQuote{Classes of Nonseperable, Spatio-Temporal Stationary Covariance Functions}, \emph{Journal of the American Statistical Association}, 94, 1330-1340.

   Smith, B.J. and Oleson, J.J. (2007) \dQuote{Geostatistical Hierarchical Model for Temporally Integrated Radon Measurements}, \emph{Jounal of Agricultural, Biological, and Environmental Statistics}, in press.
}

\author{
   Brian Smith \email{brian-j-smith@uiowa.edu}
}

\seealso{
   \code{\link{corRClasses}}
}

\examples{
sp1 <- corRExpwr2Dt(form = ~ x + y + t1 + t2)

spatDat <- data.frame(x = (0:4)/4, y = (0:4)/4, t1=(0:4)/4, t2=(1:5)/4)

cs1ExpwrDt <- corRExpwr2Dt(c(1, 1, 1, 1), form = ~ x + y + t1 + t2)
cs1ExpwrDt <- Initialize(cs1ExpwrDt, spatDat)
corMatrix(cs1ExpwrDt)

cs2ExpwrDt <- corRExpwr2Dt(c(1, 1, 1, 1), form = ~ x + y + t1 + t2, metric = "man")
cs2ExpwrDt <- Initialize(cs2ExpwrDt, spatDat)
corMatrix(cs2ExpwrDt)
}

\keyword{models}
