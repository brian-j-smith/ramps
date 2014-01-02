\name{corRGneit}
\alias{corRGneit}

\title{Gneiting Spatial Correlation Structure}

\description{
   This function is a constructor for the \code{'corRGneit'} class, representing the Gneiting approximation to the Gaussian correlation structure. Letting \eqn{r} denote the range, the correlation between two observations a distance \eqn{d < r / s} apart is \eqn{(1 + 8 s x + 25 (s x)^2 + 32 (s x)^3) (1 - s x)^8}{(1 + 8 * s * x + 25 * (s * x)^2 + 32 * (s * x)^3) * (1 - s * x)^8}, where s = 0.301187465825.  If \eqn{d \geq r / s}{d >= r / s} the correlation is zero.
}

\usage{
   corRGneit(value = numeric(0), form = ~ 1,
             metric = c("euclidean", "maximum", "manhattan", "haversine"),
             radius = 3956)
}

\arguments{
   \item{value}{optional numeric \dQuote{range} parameter value for the Gneiting correlation structure, which must be greater than zero.  Defaults to \code{numeric(0)}, which results in a range of 90\% of the minimum distance being assigned to the parameter when \code{object} is initialized.}

   \item{form}{one-sided formula of the form \code{~ S1+...+Sp}, specifying spatial covariates \code{S1} through \code{Sp}. Defaults to \code{~ 1}, which corresponds to using the order of the observations in the data as a covariate.}

   \item{metric}{optional character string specifying the distance metric to be used. The currently available options are \code{"euclidean"} for the root sum-of-squares of distances;   \code{"maximum"} for the maximum difference; \code{"manhattan"} for the sum of the absolute differences; and \code{"haversine"} for the great-circle distance between longitude/latitude coordinates. Partial matching of arguments is used, so only the first three characters need to be provided. Defaults to \code{"euclidean"}.}

   \item{radius}{radius to be used in the haversine formula for great-circle distance.  Defaults to the Earth's radius of 3,956 miles.}
}

\note{
   When \code{"haversine"} is used as the distance metric, longitude and latitude coordinates must be given as the first and second covariates, respectively, in the formula specification for the \code{form} argument.
}

\value{
   Object of class \code{'corRGneit'}, also inheriting from class \code{'corSpatial'}, representing the Gneiting spatial correlation structure.
}

\references{
   Gneiting, T. (1999), \dQuote{Correlation Functions for Atmospheric Data Analysis}, \emph{Quarterly Journal of the Royal Meteorological Society}, 125(559), 2449-2464.

   Venables, W.N. and Ripley, B.D. (1997) \dQuote{Modern Applied Statistics with S-plus}, 2nd Edition, Springer-Verlag.
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
sp1 <- corRGneit(form = ~ x + y + z)

spatDat <- data.frame(x = (0:4)/4, y = (0:4)/4)

cs1Gneit <- corRGneit(1, form = ~ x + y)
cs1Gneit <- Initialize(cs1Gneit, spatDat)
corMatrix(cs1Gneit)

cs2Gneit <- corRGneit(1, form = ~ x + y, metric = "man")
cs2Gneit <- Initialize(cs2Gneit, spatDat)
corMatrix(cs2Gneit)
}

\keyword{models}
