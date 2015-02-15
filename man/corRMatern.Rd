\name{corRMatern}
\alias{corRMatern}

\title{Matern Spatial Correlation Structure}

\description{
   This function is a constructor for the \code{'corRMatern'} class, representing a Matern spatial correlation structure. Letting \eqn{r} denote the range, and \eqn{s} the scale, the correlation between two observations a distance \eqn{d} apart is \eqn{1/(2^{s-1} \Gamma(s)) (d/r)^s K_s(d/r)}{1/(2^(s-1)*gamma(s))*(d/r)^s*besselK(d/r, s)}.
}

\usage{
   corRMatern(value = numeric(0), form = ~ 1,
              metric = c("euclidean", "maximum", "manhattan", "haversine"),
              radius = 3956)
}

\arguments{
   \item{value}{optional numeric vector of two parameter values for the Matern correlation structure, corresponding to the \dQuote{range} and \dQuote{scale}.  The range parameter value must be greater than zero, and the scale in the interval (0, 2].  Defaults to \code{numeric(0)}, which results in a range of 90\% of the minimum distance and a scale of 0.5 being assigned to the parameter when \code{object} is initialized.}

   \item{form}{one-sided formula of the form \code{~ S1+...+Sp}, specifying spatial covariates \code{S1} through \code{Sp}. Defaults to \code{~ 1}, which corresponds to using the order of the observations in the data as a covariate.}

   \item{metric}{optional character string specifying the distance metric to be used. The currently available options are \code{"euclidean"} for the root sum-of-squares of distances;   \code{"maximum"} for the maximum difference; \code{"manhattan"} for the sum of the absolute differences; and \code{"haversine"} for the great-circle distance (miles) between longitude/latitude coordinates. Partial matching of arguments is used, so only the first three characters need to be provided. Defaults to \code{"euclidean"}.}

   \item{radius}{radius to be used in the haversine formula for great-circle distance.  Defaults to the Earth's radius of 3,956 miles.}
}

\note{
   When \code{"haversine"} is used as the distance metric, longitude and latitude coordinates must be given as the first and second covariates, respectively, in the formula specification for the \code{form} argument.
}

\value{
   Object of class \code{'corRMatern'}, also inheriting from class \code{'corSpatial'}, representing a Matern spatial correlation structure.
}

\references{
   Cressie, N.A.C. (1993), \dQuote{Statistics for Spatial Data}, J. Wiley & Sons.

   Venables, W.N. and Ripley, B.D. (1997) \dQuote{Modern Applied Statistics with S-plus}, 2nd Edition, Springer-Verlag.
}

\author{
   Brian Smith \email{brian-j-smith@uiowa.edu}
}

\seealso{
   \code{\link{corRClasses}}
}

\examples{
sp1 <- corRMatern(form = ~ x + y + z)

spatDat <- data.frame(x = (0:4)/4, y = (0:4)/4)

cs1Matern <- corRMatern(c(1, 1), form = ~ x + y)
cs1Matern <- Initialize(cs1Matern, spatDat)
corMatrix(cs1Matern)

cs2Matern <- corRMatern(c(1, 1), form = ~ x + y, metric = "man")
cs2Matern <- Initialize(cs2Matern, spatDat)
corMatrix(cs2Matern)
}

\keyword{models}
