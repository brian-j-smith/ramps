\name{summary.ramps}
\alias{summary.ramps}

\title{Posterior Summaries of georamps Model Fits}

\description{
   Posterior summaries of \code{\link{georamps}} model parameters.
}

\usage{
   \method{summary}{ramps}(object, \dots)
}

\arguments{
   \item{object}{object returned by \code{georamps}.}
   \item{\dots}{additional arguments to be passed to \code{summary.mcmc}.}
}

\value{
   Two sets of summary statistics for each model parameter.  Sample mean, standard deviation, naive standard error of the mean, and time-series-based standard error are included in the first set.  Quantiles are included in the second.
}

\author{
   Brian Smith \email{brian-j-smith@uiowa.edu}
}

\seealso{
   \code{\link{georamps}}
   \code{\link[coda]{summary.mcmc}}
}

\examples{
## Posterior summaries for georamps example results

\dontrun{
summary(NURE.fit)
}
}

\keyword{models}
