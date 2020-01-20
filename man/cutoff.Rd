\name{cutoff}
\alias{cutoff}
\title{Compute a cutoff value given the scores of a person-fit statistic}
\description{Compute a cutoff value given the scores of a person-fit statistic.}

\usage{
cutoff(x, 
       ModelFit = "NonParametric", Nreps=1000,
       IP=x$IP, IRT.PModel=x$IRT.PModel, Ability=x$Ability,
       Ability.PModel=x$Ability.PModel, mu=0, sigma=1, 
       Blvl = 0.05, Breps = 1000, CIlvl = 0.95, 
       UDlvl = NA)
}

\arguments{
  \item{x}{Object of class "PerFit".}
  \item{ModelFit}{Method required to compute model-fitting item score patterns. The options available are \code{"NonParametric"} (default) and \code{"Parametric"}.}
  \item{Nreps}{Number of model-fitting item score patterns generated. Default is 1000.}
  \item{IP}{Matrix with previously estimated item parameters. Default is \code{x$IP}.}
  \item{IRT.PModel}{Parametric IRT model (required if \code{"ModelFit=Parametric"} or if the person fit statistic is parametric). Default is \code{x$IRT.PModel}.}
  \item{Ability}{Matrix with previously estimated item parameters. Default is \code{x$Ability}.}
  \item{Ability.PModel}{Method to use in order to estimate the latent ability parameters (required if \code{"ModelFit=Parametric"} or if the person fit statistic is parametric). Default is \code{x$Ability.PModel}.}
  \item{mu}{Mean of the apriori distribution. Only used when \code{method="BM"}. Default is 0.}
  \item{sigma}{Standard deviation of the apriori distribution. Only used when \code{method="BM"}. Default is 1.}
  \item{Blvl}{Significance level for bootstrap distribution (value between 0 and 1). Default is 0.05.}
  \item{Breps}{Number of bootstrap resamples. Default is 1000.}
  \item{CIlvl}{Level of bootstrap percentile confidence interval for the cutoff statistic.}
  \item{UDlvl}{User-defined cutoff level.}
}

\details{
This function computes a reference value (referred to as a 'cutoff') associated to the values of a person-fit statistic computed from a sample. The idea is to create a decision rule: Individual person-fit values at or more extreme than the cutoff result in flagging the corresponding respondents as (potentially) displaying aberrant response behavior.

Depending on the person-fit statistic, an "extreme" score might be a very small (e.g., for \code{Ht}) or a very large (e.g., for \code{G}) value. The \code{cutoff} function routinely reports of which type the person-fit statistic being used is (\code{Tail="lower"} or \code{Tail="upper"}, respectively).

The procedure consists of generating \code{Nreps} model-fitting item response vectors based on parametric model parameters (when \code{ModelFit="Parametric"}) or on proportion of respondents per answer category (when \code{ModelFit="NonParametric"}). This allows computing a sample of \code{Nreps} values of the person fit statistic corresponding to model-fitting item response patterns. A bootstrap procedure is then used to approximate the sampling distribution of the quantile of level \code{Blvl} (resp., 1-\code{Blvl}) for "lower" (resp. "upper") types of person fit statistics, based on \code{Breps} resamples. The cutoff (and its standard error) is given by the median (standard deviation) of this bootstrap distribution. Alternatively, the cutoff can be manually entered by the user (e.g., when it is available from prior data calibration) by means of \code{UDlvl}.
}

\value{
An object of class "PerFit.cutoff", which is a list with 5 elements:
  \item{Cutoff}{Numeric. Value of the computed cutoff.}
  \item{Cutoff.SE}{Numeric. Bootstrap estimated standard error of the cutoff value.}
  \item{Prop.flagged }{Numeric. Proportion of respondents flagged (that is, with person-fit scores at or more extreme than the cutoff).}
  \item{Tail}{String with values "lower" or "upper". It indicates the type of person-fit statistic.}
  \item{Cutoff.CI}{Numeric. Percentile bootstrap (CIlvl)\% confidence interval for the cutoff value.}
}

\author{Jorge N. Tendeiro \email{j.n.tendeiro@rug.nl}}
\seealso{
\code{\link{flagged.resp}}, \code{\link{plot.PerFit}}, \code{\link{PRFplot}}
}
\examples{
# Load the inadequacy scale data (dichotomous item scores):
data(InadequacyData)

# As an example, compute the Ht person-fit scores:
Ht.out <- Ht(InadequacyData)

# Compute the cutoff value at 1% level:
cutoff(Ht.out, Blvl=.01)
}
\keyword{univar}

