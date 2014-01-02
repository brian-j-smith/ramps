\name{expand.chain}
\alias{expand.chain}

\title{Expand MCMC Samples for georamps Model Fits}

\description{
   Generates additional posterior samples for \code{georamps} model fits by restarting the MCMC sampler at the last set of sampled parameter values.
}

\usage{
   expand.chain(object, n)
}

\arguments{
   \item{object}{object returned by \code{georamps}.}
   \item{n}{additional number of times to iterate the MCMC sampler.}
}

\value{
   \code{'ramps'} object containing the previously and newly sampled parameter values.
}

\author{
   Brian Smith \email{brian-j-smith@uiowa.edu}
}

\seealso{
   \code{\link{georamps}}
}

\examples{
## Generate 25 additional samples for the georamps example

\dontrun{
fit <- expand.chain(NURE.fit, 25)
}
}

\keyword{models}

