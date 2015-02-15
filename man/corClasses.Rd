\name{corClasses}
\alias{corClasses}

\title{Spatial Correlation Structure Classes}

\description{
   Standard classes of spatial correlation structures available for the \code{\link{georamps}} function.

   Spatial Structures:
   \describe{
      \item{\code{\link{corRCauchy}}}{Cauchy correlation.}
      \item{\code{\link{corRExp}}}{exponential correlation.}
      \item{\code{\link{corRExpwr}}}{powered exponential correlation.}
      \item{\code{\link{corRGaus}}}{Gaussian correlation.}
      \item{\code{\link{corRGneit}}}{Gneiting approximation to Gaussian correlation.}
      \item{\code{\link{corRLin}}}{linear correlation.}
      \item{\code{\link{corRMatern}}}{Matern correlation.}
      \item{\code{\link{corRSpher}}}{spherical correlation.}
      \item{\code{\link{corRWave}}}{sine wave correlation.}
   }

   Spatio-Temporal Structures:
   \describe{
      \item{\code{\link{corRExp2}}}{exponential correlation.}
      \item{\code{\link{corRExpwr2}}}{powered exponential correlation.}
   }

   Temporally Integrated Spatial Structure:
   \describe{
      \item{\code{\link{corRExpwr2Dt}}}{powered exponential correlation.}
   }
}

\note{
   Users may define their own \code{corRStruct} classes by specifying a \code{constructor} function and, at a minimum, methods for the functions \code{corMatrix} and \code{coef}.
}

\author{
   Brian Smith \email{brian-j-smith@uiowa.edu} and Jose Pinheiro \email{Jose.Pinheiro@pharma.novartis.com}, and Douglas Bates \email{bates@stat.wisc.edu} 
}

\seealso{
   \code{\link{corRCauchy}},
   \code{\link{corRExp}},
   \code{\link{corRExp2}},
   \code{\link{corRExpwr}},
   \code{\link{corRExpwr2}},
   \code{\link{corRExpwr2Dt}},
   \code{\link{corRGaus}},
   \code{\link{corRGneit}},
   \code{\link{corRLin}},
   \code{\link{corRMatern}},
   \code{\link{corRSpher}}
   \code{\link{corRWave}}
}

\keyword{models}
