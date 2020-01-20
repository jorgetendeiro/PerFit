\name{flagged.resp}
\alias{flagged.resp}
\title{Find (potentially) aberrant response patterns}
\description{Find which respondents in the sample were flagged by the specified person-fit statistic.}
\usage{
flagged.resp(x, cutoff.obj=NULL, 
             scores=TRUE, ord=TRUE,
             ModelFit="NonParametric", Nreps=1000,
             IP=x$IP, IRT.PModel=x$IRT.PModel, Ability=x$Ability,
             Ability.PModel=x$Ability.PModel, mu=0, sigma=1, 
             Blvl = 0.05, Breps = 1000, CIlvl = 0.95, 
             UDlvl=NA)
}

\arguments{
  \item{x}{Object of class "PerFit".}
  \item{cutoff.obj}{Object of class "PerFit.cutoff".}
  \item{scores}{Logical: Should item scores of flagged respondents be shown in the output? Default is \code{TRUE}.}
  \item{ord}{Logical: Should items be ordered in increasing order of difficulty (i.e., in decreasing proportion-correct order)? Default is \code{TRUE}. Only used if \code{scores=TRUE}.}
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

\details{This function finds the respondents in the dataset that were flagged by the person-fit statistic. This statistic is specified by means of the "PerFit" class object \code{x} (\code{x$PFStatistic}). 

The cutoff score may be provided by means of the \code{cutoff.obj} object, otherwise it is internally computed (for which the function parameters \code{ModelFit} through \code{CIlvl} are required; see \code{\link{cutoff}} for more details).

If \code{scores=TRUE} then the respondents' item scores will be shown in the output, either in the original item order (\code{ord=FALSE}) or in increasing difficulty order (\code{ord=TRUE}).
}

\value{
If \code{scores=FALSE} the output is a list with 3 elements:
  \item{\code{PFSscores}}{A two-column matrix with the row index and the value of the person-fit statistic for the flagged respondents.}
  \item{\code{Cutoff.lst}}{The corresponding \code{PerFit.cutoff} object.}
  \item{\code{PFS} }{The person-fit statistic.}
  
If \code{scores=TRUE} the output is a list with four elements:
  \item{\code{Scores} }{Matrix with columns: \code{FlaggedID}, item scores (\code{It**}), and \code{PFscores}.}
  \item{\code{MeanItemValue} }{The items mean value (which is nothing more than the proportion-correct for dichotomous items).}
  \item{\code{Cutoff.lst}}{The corresponding \code{PerFit.cutoff} object.}
  \item{\code{PFS} }{The person-fit statistic.}
}
\author{Jorge N. Tendeiro \email{j.n.tendeiro@rug.nl}}
\seealso{
\code{\link{cutoff}}, \code{\link{plot.PerFit}}, \code{\link{PRFplot}}
}
\examples{
# Load the inadequacy scale data (dichotomous item scores):
data(InadequacyData)

# As an example, compute the Ht person-fit scores:
Ht.out <- Ht(InadequacyData)
Ht.out$PFscores

# Estimate the cutoff value at 1% level:
Ht.cut <- cutoff(Ht.out, Blvl=.01)

# Determine which respondents were flagged by Ht at 1% level:
flagged.resp(Ht.out, Ht.cut, scores=FALSE)$PFSscores
}
\keyword{univar}

