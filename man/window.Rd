\name{window}
\alias{window.predict.ramps}
\alias{window.ramps}

\title{Subsetting of MCMC Sampler Results}

\description{
   Post-processing function to subset the MCMC iterations in \code{georamps} or \code{predict.ramps} results.
}

\usage{
   \method{window}{ramps}(x, iter, ...)

   \method{window}{predict.ramps}(x, iter, ...)
}

\arguments{
   \item{x}{object returned by \code{georamps} or \code{predict.ramps}.}
   \item{iter}{numerical vector specifying the MCMC iterations to subset.}
   \item{\dots}{some methods for this generic require additional arguments.  None are used in this method.}
}

\value{
   Subsetted object of the same class as the one supplied.
}

\author{
   Brian Smith \email{brian-j-smith@uiowa.edu}
}

\seealso{
   \code{\link{georamps}}
   \code{\link{predict.ramps}}
}

\examples{
## Exclude first five iterations of the georamps example results

\dontrun{
fit <- window(NURE.fit, iter = 6:25)
print(fit)
summary(fit)
}
}

\keyword{models}
