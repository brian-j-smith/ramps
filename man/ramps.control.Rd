\name{ramps.control}
\alias{ramps.control}

\title{Auxiliary for Controlling georamps Model Fitting}

\description{
   Auxiliary function that provides a user interface to control the \code{\link{georamps}} model fitting algorithm.
}

\usage{
   ramps.control(iter = 1000, beta, sigma2.e, phi, sigma2.z, sigma2.re,
                 z.monitor = TRUE, mpdfun = c("mpdbeta", "mpdbetaz"), file)
}

\arguments{
   \item{iter}{numerical value indicating the number of consecutive MCMC samples to generate, or a vector indicating specific iterations to monitor.}

   \item{beta}{\code{'param'} object of initial values and hyperparameters for the main effects coefficients.  Flat priors are currently supported for these parameters.  Argument is optional if no main effects appear in the model.}

   \item{sigma2.e}{\code{'param'} object of initial values and hyperparameters for the measurement error variances.  Inverse-gamma priors are currently supported.  Argument is optional if no measurement error variances appear in the model.}

   \item{phi}{\code{'param'} object of initial values and hyperparameters for the spatial correlation parameters.  Uniform and user-defined priors are currently supported.  Argument is optional if no correlation parameters appear in the model.}

   \item{sigma2.z}{\code{'param'} object of initial values and hyperparameters for the spatial variances.  Inverse-gamma priors are currently supported.  Argument is optional if no spatial variances appear in the model.}

   \item{sigma2.re}{\code{'param'} object of initial values and hyperparameters for the random effects variances.  Inverse-gamma priors are currently supported.  Argument is optional if no random effects appear in the model.}

   \item{z.monitor}{logical value indicating whether to monitor the latent spatial parameters, or data frame containing a subset of the coordinates at which to monitor the parameters.}

   \item{mpdfun}{character string giving the type of marginalized posterior density used for slice sampling and calculation of the data likelihood.  Default is marginalization with respect to the beta parameters \code{"mpdbeta"}, and the alternative is with respect to both the beta and z parameters \code{"mpdbetaz"}.  The latter may provide faster MCMC sampling when analyzing data with multiple observation per measurement site.  The two options generate samples from the same posterior distribution.}

   \item{file}{vector or list of character strings specifying external files to which to save monitored parameters.  Elements of the object named \dQuote{params} and \dQuote{z} will be taken to be the output files for model parameters and latent parameters, respectively.  If these element names are not supplied, then the first element is taken to be the \dQuote{params} output file and the second the \dQuote{z} output file.  Defaults to no external outputting of monitored parameters.}
}

\details{
   Tuning parameters may be set for the \code{sigma2} and \code{phi} arguments via the \code{param} function.  If a user-defined prior is specified, then tuning parameters must be supplied and are taken to be the initial widths of the slice sampling windows.  Otherwise, tuning parameters are taken to be factors by which the initial widths are multiplied.  Separate tuning parameters may be set for each of the arguments.  However, only the minimum of all \code{sigma2} tuning parameters is used in the sampling of those parameters.
}

\value{
   A list containing the following components:
   \item{iter}{sorted numerical vector of unique MCMC iterations to be monitored.}
   \item{beta}{\code{'param'} object of initial values for the main effects coefficients.}
   \item{sigma2.e}{\code{'param'} object of initial values for the measurement error variances.}
   \item{phi}{\code{'param'} object of initial values for the spatial correlation parameters.}
   \item{sigma2.z}{\code{'param'} object of initial values for the spatial variances.}
   \item{sigma2.re}{\code{'param'} object of initial values for the random effects variances.}
   \item{z}{list with element: \code{monitor} containing a logical monitoring indicator for the latent spatial parameters or a data frame of coordinates at which to monitor the parameters.}
   \item{mpdfun}{character string specifying the marginalized posterior distribution.}
   \item{file}{list with elements: \code{params} and \code{z} character strings specifying external files to which to save monitored model and spatial parameters.}
   \item{expand}{non-negative integer value indicating the starting point of the MCMC sampler, initialized to zero.}
}

\author{
   Brian Smith \email{brian-j-smith@uiowa.edu}
}

\seealso{
   \code{\link{georamps}},
   \code{\link{param}}
}

\examples{
ctrl <- ramps.control(
   iter = seq(1, 100, by = 2),
   beta = param(rep(0, 2), "flat"),
   sigma2.e = param(rep(1, 2), "invgamma", shape = 2.0, scale = 0.1),
   phi = param(10, "uniform", min = 0, max = 100, tuning = 0.5),
   sigma2.z = param(1, "invgamma", shape = 2.0, scale = 0.1),
   file = c("params.txt", "z.txt")
)
}

\keyword{models}
