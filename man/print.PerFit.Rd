\name{print PerFit}
\alias{print.PerFit}
\title{Print method for objects of class "PerFit"}
\description{Print method for objects of class "PerFit".}

\usage{
\method{print}{PerFit}(x, ...)
 }
 
\arguments{
  \item{x}{Object of class "PerFit".}
  \item{...}{Additional arguments to be passed to \code{print}.}
}

\details{
For a given object of class \code{PerFit}, this function displays the scores of the person-fit statistic.
}

\author{Jorge N. Tendeiro \email{j.n.tendeiro@rug.nl}}
\seealso{
\code{\link{cutoff}}, \code{\link{flagged.resp}}, \code{\link{plot.PerFit}}, \code{\link{summary.PerFit}}
}
\examples{
# Load the inadequacy scale data (dichotomous item scores):
data(InadequacyData)

# Compute the ZU3 scores:
ZU3.out <- ZU3(InadequacyData)

print(ZU3.out)
}
\keyword{univar}

