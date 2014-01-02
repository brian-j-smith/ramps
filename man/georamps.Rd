\name{georamps}
\alias{georamps}
\alias{print.ramps}

\title{Bayesian Geostatistical Model Fitting with RAMPS}

\description{
   General function for fitting Bayesian geostatistical models using the reparameterized and marginalized posterior sampling (RAMPS) algorithm of Yan et al. (2007).
}

\usage{
   georamps(fixed, random, correlation, data, subset, weights,
            variance = list(fixed = ~ 1, random = ~ 1, spatial = ~ 1),
            aggregate = list(grid = NULL, blockid = ""), kmat = NULL,
            control = ramps.control(\dots), contrasts = NULL, \dots)
}

\arguments{
   \item{fixed}{two-sided linear \code{"formula"} object describing the main effects in the mean structure of the model, with the response on the left of a \code{~} operator and the terms, separated by \code{+} operators, on the right.}

   \item{random}{optional one-sided formula of the form \code{~ 1 | g}, specifying random intercepts for groups defined by the factor \code{g}. Several grouping variables may be simultaneously specified, separated by the \code{*} operator, as in \code{~ 1 | g1 * g2 * g3}. In such cases, the levels of each variable are pasted together and the resulting factor used to group the observations.  Missing \code{NA} values may be given in the grouping variable to omit random effects for the associated measurements.}

   \item{correlation}{\code{'corSpatial'} object describing the spatial correlation structure.  See the \code{corClasses} documentation for a listing of the available structures.}

   \item{data}{optional data frame containing the variables named in \code{fixed}, \code{random}, \code{correlation}, \code{weights}, \code{variance}, and \code{subset}.}

   \item{subset}{optional expression indicating the subset of rows in \code{data} that should be used in the fit. This can be a logical vector, or a numerical vector indicating which observation numbers are to be included, or a character vector of the row names to be included. All observations are included by default.}

   \item{weights}{optional numerical vector of measurement error variance (inverse) weights to be used in the fitting process. Defaults to a value of 1 for point-source measurements and the number of grid points for areal measurements (see the \code{aggregate} argument below).}

   \item{variance}{optional list of one-sided formulas, each of the form \code{~ g} where \code{g} defines a grouping factor for the following elements: \code{fixed} for measurement error variances; \code{random} for random effects error variances; and \code{spatial} for spatial variances.  A single variance is assumed in each case by default.}

   \item{aggregate}{optional list of elements: \code{grid} a data frame of coordinates to use for Monte Carlo integration over geographic blocks at which areal measurements are available; and \code{blockid} a character string specifying the column by which to merge the areal measurements in \code{data} with the grid coordinates in \code{grid}.  Merging is only performed for \code{blockid} values that are common to both datasets.  All observations in \code{data} are treated as point-source measurements by default.}
   
   \item{kmat}{optional \eqn{n \times s}{n * s} design matrix for mapping spatial sites to outcome responses, where \eqn{n} is the number of responses and \eqn{s} the number of unique sites.  Unique sites are ordered first according to those supplied to the \code{data} argument and second to those supplied to the \code{aggregate} argument.  Defaults to \code{kmat[i,j] = 1 / N[i]} if site \code{j} is one of \code{N[i]} measurement sites contributing to response \code{i}; otherwise \code{kmat[i,j] = 0}.  Rows or columns of zeros are not supported.}

   \item{control}{list of parameters for controlling the fitting process. See the \code{ramps.control} documentation for details.}

   \item{contrasts}{optional list. See the \code{contrasts.arg} of \code{\link[stats]{model.matrix}}.}

   \item{\dots}{further arguments passed to or from other methods.}
}

\value{
   An object of class \code{'ramps'} containing the following elements:
   \item{params}{\code{'mcmc'} object of monitored model parameters with variable labels in the column names and MCMC iteration numbers in the row names.}
   \item{z}{\code{'mcmc'} object of monitored latent spatial parameters with variable labels in the column names and MCMC iteration numbers in the row names.}
   \item{loglik}{vector of data log-likelihood values at each MCMC iteration.}
   \item{evals}{vector of slice sampler evaluations at each MCMC iteration.}
   \item{call}{the matched function call to \code{georamps}.}
   \item{y}{response vector.}
   \item{xmat}{design matrix for the main effects.}
   \item{terms}{the \code{'terms'} object for \code{xmat}.}
   \item{xlevels}{list of the factor levels for \code{xmat}.}
   \item{etype}{grouping factor for the measurement error variances.}
   \item{weights}{weights used in the fitting process.}
   \item{kmat}{matrix for mapping the spatial parameters to the observed data.}
   \item{correlation}{specified \code{'corSpatial'} object for the spatial correlation structure.}
   \item{coords}{matrix of unique coordinates for the measurement and grid sites.}
   \item{ztype}{grouping factor for the spatial variances.}
   \item{wmat}{matrix for mapping the random effects to the observed data.}
   \item{retype}{grouping factor for the random effects variances.}
   \item{control}{a list of control parameters used in the fitting process.}
}

\references{
   Yan, J., Cowles, M.K., Wang, S., and Armstrong, M. (2007) \dQuote{Parallelizing MCMC for Bayesian Spatiotemporal Geostatistical Models}, \emph{Statistics and Computing}, 17(4), 323-335.

   Smith, B. J., Yan, J., and Cowles, M. K. (2008) \dQuote{Unified Geostatistical Modeling for Data Fusion and Spatial Heteroskedasticity with R Package ramps}, \emph{Journal of Statistical Software}, 25(10), 1-21.
}

\author{
   Brian Smith \email{brian-j-smith@uiowa.edu}, Jun Yan \email{jun.yan@uconn.edu}, and Kate Cowles \email{kate-cowles@uiowa.edu}}

\seealso{
   \code{\link{corClasses}},
   \code{\link{ramps.control}},
   \code{\link[coda]{mcmc}},
   \code{\link{DIC.ramps}},
   \code{\link{plot.ramps}},
   \code{\link{predict.ramps}},
   \code{\link{summary.ramps}},
   \code{\link{window.ramps}}
}

\examples{
\dontrun{
## Load the included uranium datasets for use in this example
data(NURE)

## Geostatistical analysis of areal measurements
NURE.ctrl1 <- ramps.control(
   iter = 25,
   beta = param(0, "flat"),
   sigma2.e = param(1, "invgamma", shape = 2.0, scale = 0.1, tuning = 0.75),
   phi = param(10, "uniform", min = 0, max = 35, tuning = 0.50),
   sigma2.z = param(1, "invgamma", shape = 2.0, scale = 0.1)
)

NURE.fit1 <- georamps(log(ppm) ~ 1,
   correlation = corRExp(form = ~ lon + lat, metric = "haversine"),
   weights = area,
   data = NURE,
   subset = (measurement == 1),
   aggregate = list(grid = NURE.grid, blockid = "id"),
   control = NURE.ctrl1
)
print(NURE.fit1)
summary(NURE.fit1)


## Analysis of point-source measurements
NURE.ctrl2 <- ramps.control(
   iter = 25,
   beta = param(0, "flat"),
   sigma2.e = param(1, "invgamma", shape = 2.0, scale = 0.1, tuning = 0.75),
   phi = param(10, "uniform", min = 0, max = 35, tuning = 0.5),
   sigma2.z = param(1, "invgamma", shape = 2.0, scale = 0.1)
)

NURE.fit2 <- georamps(log(ppm) ~ 1,
   correlation = corRExp(form = ~ lon + lat, metric = "haversine"),
   data = NURE,
   subset = (measurement == 2),
   control = NURE.ctrl2
)
print(NURE.fit2)
summary(NURE.fit2)


## Joint analysis of areal and point-source measurements with
## prediction only at grid sites
NURE.ctrl <- ramps.control(
   iter = 25,
   beta = param(rep(0, 2), "flat"),
   sigma2.e = param(rep(1, 2), "invgamma", shape = 2.0, scale = 0.1, tuning = 0.75),
   phi = param(10, "uniform", min = 0, max = 35, tuning = 0.5),
   sigma2.z = param(1, "invgamma", shape = 2.0, scale = 0.1),
   z.monitor = NURE.grid
)

NURE.fit <- georamps(log(ppm) ~ factor(measurement) - 1,
   correlation = corRExp(form = ~ lon + lat, metric = "haversine"),
   variance = list(fixed = ~ measurement),
   weights = area * (measurement == 1) + (measurement == 2),
   data = NURE,
   aggregate = list(grid = NURE.grid, blockid = "id"),
   control = NURE.ctrl
)
print(NURE.fit)
summary(NURE.fit)


## Discard initial 5 MCMC samples as a burn-in sequence
fit <- window(NURE.fit, iter = 6:25)
print(fit)
summary(fit)

## Deviance Information Criterion
DIC(fit)

## Prediction at unmeasured sites
ct <- map("state", "connecticut", plot = FALSE)
lon <- seq(min(ct$x, na.rm = TRUE), max(ct$x, na.rm = TRUE), length = 20)
lat <- seq(min(ct$y, na.rm = TRUE), max(ct$y, na.rm = TRUE), length = 15)
grid <- expand.grid(lon, lat)

newsites <- data.frame(lon = grid[,1], lat = grid[,2],
                       measurement = 1)
pred <- predict(fit, newsites)

plot(pred, func = function(x) exp(mean(x)),
     database = "state", regions = "connecticut",
     resolution = c(200, 150), bw = 5,
     main = "Posterior Mean",
     legend.args = list(text = "ppm", side = 3, line = 1))

plot(pred, func = function(x) exp(sd(x)),
     database = "state", regions = "connecticut",
     resolution = c(200, 150), bw = 5,
     main = "Posterior Standard Deviation",
     legend.args = list(text = "ppm", side = 3, line = 1))
}
}

\keyword{models}
