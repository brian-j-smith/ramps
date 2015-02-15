\name{corRExpwr}
\alias{corRExpwr}

\title{Powered Exponential Spatial Correlation Structure}

\description{
   This function is a constructor for the \code{'corRExpwr'} class, representing a powered exponential spatial correlation structure. Letting \eqn{r} denote the range and \eqn{p} the shape, the correlation between two observations a distance \eqn{d} apart is \eqn{\exp(-(d/r)^p)}{exp(-(d/r)^p)}.
}

\usage{
   corRExpwr(value = numeric(0), form = ~ 1,
             metric = c("euclidean", "maximum", "manhattan", "haversine"),
             radius = 3956)
}

\arguments{
   \item{value}{optional numeric vector of two parameter values for the powered exponential correlation structure, corresponding to the \dQuote{range} and \dQuote{shape}.  The range parameter value must be greater than zero, and the shape in the interval (0, 2].  Defaults to \code{numeric(0)}, which results in a range of 90\% of the minimum distance and a shape of 1 being assigned to the parameter when \code{object} is initialized.}

   \item{form}{one-sided formula of the form \code{~ S1+...+Sp}, specifying spatial covariates \code{S1} through \code{Sp}. Defaults to \code{~ 1}, which corresponds to using the order of the observations in the data as a covariate.}

   \item{metric}{optional character string specifying the distance metric to be used. The currently available options are \code{"euclidean"} for the root sum-of-squares of distances;   \code{"maximum"} for the maximum difference; \code{"manhattan"} for the sum of the absolute differences; and \code{"haversine"} for the great-circle distance (miles) between longitude/latitude coordinates. Partial matching of arguments is used, so only the first three characters need to be provided. Defaults to \code{"euclidean"}.}

   \item{radius}{radius to be used in the haversine formula for great-circle distance.  Defaults to the Earth's radius of 3,956 miles.}
}

\note{
   When \code{"haversine"} is used as the distance metric, longitude and latitude coordinates must be given as the first and second covariates, respectively, in the formula specification for the \code{form} argument.
}

\value{
   Object of class \code{'corRExpwr'}, also inheriting from class \code{'corSpatial'}, representing a powered exponential spatial correlation structure.
}

\references{
   Cressie, N.A.C. (1993), \dQuote{Statistics for Spatial Data}, J. Wiley & Sons.

   Venables, W.N. and Ripley, B.D. (1997) \dQuote{Modern Applied Statistics with S-plus}, 2nd Edition, Springer-Verlag.
}

\author{
   Brian Smith \email{brian-j-smith@uiowa.edu}
}

\seealso{
   \code{\link{corClasses}}
}

\examples{
sp1 <- corRExpwr(form = ~ x + y + z)

spatDat <- data.frame(x = (0:4)/4, y = (0:4)/4)

cs1Expwr <- corRExpwr(c(1, 1), form = ~ x + y)
cs1Expwr <- Initialize(cs1Expwr, spatDat)
corMatrix(cs1Expwr)

cs2Expwr <- corRExpwr(c(1, 1), form = ~ x + y, metric = "man")
cs2Expwr <- Initialize(cs2Expwr, spatDat)
corMatrix(cs2Expwr)
}

\keyword{models}
