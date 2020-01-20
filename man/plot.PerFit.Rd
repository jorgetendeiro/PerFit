\name{plot PerFit}
\alias{plot.PerFit}
\title{Plot method for objects of class "PerFit"}
\description{Plot method for objects of class "PerFit".}

\usage{
\method{plot}{PerFit}(x, cutoff.obj=NULL, 
       ModelFit="NonParametric", Nreps=1000, 
       IP=x$IP, IRT.PModel=x$IRT.PModel, Ability=x$Ability, 
       Ability.PModel=x$Ability.PModel, mu=0, sigma=1, 
       Blvl = 0.05, Breps = 1000, CIlvl = 0.95, 
       UDlvl = NA, 
       Type="Density", Both.scale=TRUE, Cutoff=TRUE, Cutoff.int=TRUE,
       Flagged.ticks = TRUE, 
       Xlabel=NA, Xcex=1.5, title=NA, Tcex=1.5,
       col.area="lightpink", col.hist="lightblue", col.int="darkgreen",
       col.ticks="red", ...)
}
 
\arguments{
  \item{x}{Object of class "PerFit".}
  \item{cutoff.obj}{Object of class "PerFit.cutoff".}
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
  \item{Type}{Type of plot: \code{"Histogram"}, \code{"Density"} (default), \code{"Both"}.}
  \item{Both.scale}{Logical: Should the y-axis be adjusted so that both the histogram and the density graphics are completely visible? Default is \code{TRUE}.}
  \item{Cutoff}{Logical: Should the estimated cutoff be added to the plot? Default is \code{TRUE}.}
  \item{Cutoff.int}{Logical: Should an approximated (1-Blvl)\% bootstrap confidence interval be added to the plot? Default is \code{TRUE}.}
  \item{Flagged.ticks}{Logical: Should ticks representing the flagged respondents be added to the plot? Default is \code{TRUE}.}
  \item{Xlabel}{Label of x-axis, otherwise a default label is shown.}
  \item{Xcex}{Font size of the label of x-axis.}
  \item{title}{Title of the plot, otherwise a default title is shown.}
  \item{Tcex}{Font size of the title of the plot.}
  \item{col.area}{Color of "flagging region".}
  \item{col.hist}{Color of histogram.}
  \item{col.int}{Color of bootstrap confidence interval.}
  \item{col.ticks}{Color of the ticks marking the flagged respondents.}
  \item{...}{Extra graphical parameters to be passed to \code{plot}.}
}

\details{
This function plots the empirical distribution of the scores of the person-fit statistic specified by the "PerFit" class object \code{x}. A histogram, density, or a combination of both displays is possible. 

The cutoff score may be provided by means of the \code{cutoff.obj} object, otherwise it is internally computed (for which the function parameters \code{ModelFit} through \code{CIlvl} are required; see \code{\link{cutoff}} for more details). The value of the cutoff is superimposed to the plot when \code{Cutoff=TRUE}. In this case, the adequate "flagging region" is colored, thus indicating the range of values for which the person-fit statistic flags respondents as potentially displaying aberrant behavior. The option \code{Both.scale} was introduced to help to better tune the scale of the y-axis. Furthermore, the percentile confidence interval for the cutoff value (with confidence level defined by the \code{cutoff.obj}) is displayed in the x-axis, and ticks marking the flagged respondents are display on the top of the plot.
}

\author{Jorge N. Tendeiro \email{j.n.tendeiro@rug.nl}}
\seealso{
\code{\link{cutoff}}, \code{\link{flagged.resp}}, \code{\link{PRFplot}}
}
\examples{
# Load the inadequacy scale data (dichotomous item scores):
data(InadequacyData)

# Compute the ZU3 scores:
ZU3.out <- ZU3(InadequacyData)

# Plot the sampling distribution of the ZU3 scores, with cutoff value based on a nominal 5% level,
# and 90% confidence interval:
plot(ZU3.out, Type="Both", Blvl=.05, CIlvl = 0.90)
}
\keyword{univar}

