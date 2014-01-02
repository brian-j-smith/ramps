\name{DIC}
\alias{DIC}
\alias{DIC.ramps}

\title{Deviance Information Criterion}

\description{
   Calculates the Deviance Information Criterion (DIC) for comparisons of \code{georamps} model fits.
}

\usage{
   \method{DIC}{ramps}(object, \dots)
}

\arguments{
   \item{object}{object returned by \code{georamps}.}
   \item{\dots}{some methods for this generic require additional arguments.  None are used in this method.}
}

\value{
   An numeric vector with the following two elements:
   \item{DIC}{value of the Deviance Information Criterion.}
   \item{pD}{effective number of model parameters.}
}

\references{
   Spiegelhalter, D.J., Best, N.G., Carlin, B.P., and van der Linde, A. (2002) \dQuote{Bayesian Measures of Model Complexity and Fit}, \emph{Journal of the Royal Statistical Society - Series B}, 64, 583-639.
}

\author{
   Brian Smith \email{brian-j-smith@uiowa.edu}
}

\seealso{
   \code{\link{georamps}}
}

\examples{
## DIC calculation for georamps example results

\dontrun{
DIC(NURE.fit)
}
}

\keyword{models}
