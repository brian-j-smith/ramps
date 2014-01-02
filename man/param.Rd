\name{param}
\alias{param}

\title{Initialization of georamps Model Parameters}

\description{
   Function used in conjunction with \code{ramps.control} to specify the initial values and prior distributions used in calls to \code{georamps}.
}

\usage{
   param(init, prior = c("flat", "invgamma", "normal", "uniform", "user"), tuning,
         \dots)
}

\arguments{
   \item{init}{numerical vector of initial parameter values.  \code{NA} elements will be replaced with random draws from the prior distribution when possible.}

   \item{prior}{character string specifying the prior distribution.  This must be one of \code{"flat"}, \code{"invgamma"}, \code{"normal"}, \code{"uniform"}, or \code{"user"}, with default \code{"flat"}, and may be abbreviated to a unique prefix.}

   \item{tuning}{numerical tuning values the slice-simplex routine in the MCMC sampler.}

   \item{\dots}{hyperparameters of the specified prior distribution.  See details below.}
}

\details{
   The supported prior distributions and associated hyperparameters are:
   \describe{
      \item{\code{"flat"}}{Flat prior with no hyperparameters.}

      \item{\code{"invgamma"}}{Inverse-gamma with hyperparameters \code{shape > 0} and \code{scale > 0} such that \eqn{f(x) = scale^{shape} / \Gamma(shape) x^{-shape - 1} \exp(-scale / x)}{f(x) = scale^shape / gamma(shape) * x^{-shape - 1} * exp(-scale / x)}.}

      \item{\code{"normal"}}{Normal with hyperparameters \code{mean} and \code{variance} such that \eqn{f(x) = (2 \pi)^{-n/2} |\Sigma|^{-1/2} \exp(-1/2 (x - \mu)' \Sigma^{-1} (x - \mu))}{(2*pi)^(-n/2) * det(variance)^(-1/2) * exp(-1/2 * t(x - mean) \%*\% solve(variance) \%*\% (x - mean))}. The \code{variance} hyperparameter must be positive definite and may be supplied either as a vector (independence) or a matrix.}

      \item{\code{"uniform"}}{Uniform with hyperparameters \code{min} and \code{max > min} such that \eqn{f(x) = 1 / (max - min)}{f(x) = 1 / (max - min)}.}

      \item{\code{"user"}}{Use-defined function supplied as hyperparameter \code{f} which takes a single numeric vector of length and order equal to the associated model parameters and whose returns values are proportional to the prior distribution.}
   }

   The number of model parameters to be initialized is determined by \code{length(init)}. Missing values occurring in the supplied \code{init} vector will be replaced with draws from the prior distribution, for all but the \code{"flat"} specification.
}

\value{
   A list of class \code{'param'} containing the following components:
   \item{init}{numerical vector of initial parameter values.}
   \item{prior}{character string specifying the prior distribution.}
   \item{tuning}{numerical vector of tuning values of \code{length(init)}.}
   \item{\dots}{hyperparameters of the specified prior distribution.}
}

\author{
   Brian Smith \email{brian-j-smith@uiowa.edu}
}

\seealso{
   \code{\link{georamps}},
   \code{\link{ramps.control}}
}

\examples{
## Initial values for a flat prior
param(rep(0, 2), "flat")

## Random generation of initial values for an inverse-gamma prior
param(rep(NA, 2), "invgamma", shape = 2.0, scale = 0.1)

## Independent normal priors
param(rep(0, 2), "normal", mean = c(0, 0), variance = c(100, 100))

## Correlated normal priors
npv <- rbind(c(100, 25), c(25, 100))
param(rep(0, 2), "normal", mean = c(0, 0), variance = npv)

## Uniform prior and MCMC tuning parameter specification
param(10, "uniform", min = 0, max = 100, tuning = 0.5)
}

\keyword{models}

