\name{predict.ramps}
\alias{predict.ramps}

\title{Prediction Method for georamps Model Fits}

\description{
   Obtains prediction of main effects plus spatial variability from a \code{\link{georamps}} model fit.
}

\usage{
   \method{predict}{ramps}(object, newdata, type = c("response", "spatial", "error", "random"), \dots)
}

\arguments{
   \item{object}{object returned by \code{georamps}.}
   \item{newdata}{data frame containing covariate values for the main effect, unmeasured spatial coordinates, and (if applicable) spatial variance indices with which to predict.}
   \item{type}{character string specifying the type of spatial prediction to perform.  The default value \code{"response"} provides spatial prediction which includes measurement error and non-spatial random effects; \code{"spatial"} excludes measurement error and non-spatial random effects from the prediction; \code{"error"} excludes non-spatial random effects; and \code{"random"} excludes measurement error.}
   \item{\dots}{some methods for this generic require additional arguments.  None are used in this method.}
}

\details{
   Prediction will be performed only at the coordinates in \code{newdata} that differ from those used in the initial \code{georamps} model fitting.  In particular, overlapping coordinates will be excluded automatically in the prediction.
}


\value{
   \code{'predict.ramps'} object, inheriting from class \code{'matrix'}, of samples from the posterior predictive distribution.  Labels for the samples at each new coordinate are supplied in the returned column names and MCMC iteration numbers in the row names.  A matrix containing the new coordinates is supplied in the \code{coords} attribute of the object.
}

\author{
   Brian Smith \email{brian-j-smith@uiowa.edu}
}

\seealso{
   \code{\link{georamps}}
   \code{\link{plot.predict.ramps}},
   \code{\link{window.predict.ramps}},
}

\examples{
## Prediction for georamps example results

\dontrun{
ct <- map("state", "connecticut", plot = FALSE)
lon <- seq(min(ct$x, na.rm = TRUE), max(ct$x, na.rm = TRUE), length = 20)
lat <- seq(min(ct$y, na.rm = TRUE), max(ct$y, na.rm = TRUE), length = 15)
grid <- expand.grid(lon, lat)

newsites <- data.frame(lon = grid[,1], lat = grid[,2],
                       measurement = 1)
NURE.pred <- predict(NURE.fit, newsites)

par(mfrow=c(2,1))
plot(NURE.pred, func = function(x) exp(mean(x)),
     database = "state", regions = "connecticut",
     resolution = c(200, 150), bw = 5,
     main = "Posterior Mean",
     legend.args = list(text = "ppm", side = 3, line = 1))
plot(NURE.pred, func = function(x) exp(sd(x)),
     database = "state", regions = "connecticut",
     resolution = c(200, 150), bw = 5,
     main = "Posterior Standard Deviation",
     legend.args = list(text = "ppm", side = 3, line = 1))
}
}

\keyword{models}

