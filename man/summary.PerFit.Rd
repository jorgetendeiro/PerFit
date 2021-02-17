\name{summary PerFit}
\alias{summary.PerFit}
\title{Summary method for objects of class "PerFit"}
\description{Summary method for objects of class "PerFit".}

\usage{
\method{summary}{PerFit}(object, cutoff.obj=NULL, 
        ModelFit="NonParametric", Nreps=1000, 
        IP=object$IP, IRT.PModel=object$IRT.PModel, Ability=object$Ability,
        Ability.PModel=object$Ability.PModel, mu=0, sigma=1, 
        Blvl = 0.05, Breps = 1000, CIlvl = 0.95, 
        UDlvl = NA, ...)
}
 
\arguments{
  \item{object}{Object of class "PerFit".}
  \item{cutoff.obj}{Object of class "PerFit.cutoff".}
  \item{ModelFit}{Method required to compute model-fitting item score patterns. The options available are \code{"NonParametric"} (default) and \code{"Parametric"}.}
  \item{Nreps}{Number of model-fitting item score patterns generated. Default is 1000.}
  \item{IP}{Matrix with previously estimated item parameters. Default is \code{object$IP}.}
  \item{IRT.PModel}{Parametric IRT model (required if \code{"ModelFit=Parametric"} or if the person fit statistic is parametric). Default is \code{object$IRT.PModel}.}
  \item{Ability}{Matrix with previously estimated item parameters. Default is \code{object$Ability}.}
  \item{Ability.PModel}{Method to use in order to estimate the latent ability parameters (required if \code{"ModelFit=Parametric"} or if the person fit statistic is parametric). Default is \code{object$Ability.PModel}.}
  \item{mu}{Mean of the apriori distribution. Only used when \code{method="BM"}. Default is 0.}
  \item{sigma}{Standard deviation of the apriori distribution. Only used when \code{method="BM"}. Default is 1.}
  \item{Blvl}{Significance level for bootstrap distribution (value between 0 and 1). Default is 0.05.}
  \item{Breps}{Number of bootstrap resamples. Default is 1000.}
  \item{UDlvl}{User-defined cutoff level.}
  \item{CIlvl}{Level of bootstrap percentile confidence interval for the cutoff statistic.}
  \item{...}{Additional arguments to be passed to \code{summary}.}
}

\details{
For a given object of class \code{PerFit}, this function prints: The PFS used, the cutoff value, the tail of the distribution of the person-fit statistic associated to misfit, the proportion of flagged respondents in the sample, and their row indices.
}

\author{Jorge N. Tendeiro \email{tendeiro@hiroshima-u.ac.jp}}
\seealso{
\code{\link{cutoff}}, \code{\link{flagged.resp}}, \code{\link{plot.PerFit}}, \code{\link{summary.PerFit}}
}
\examples{
# Load the inadequacy scale data (dichotomous item scores):
data(InadequacyData)

# Compute the ZU3 scores:
ZU3.out <- ZU3(InadequacyData)

summary(ZU3.out)
}
\keyword{univar}

