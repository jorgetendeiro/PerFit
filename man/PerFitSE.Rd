\name{PerFit.SE}
\alias{PerFit.SE}
\title{Compute standard errors for person fit statistics}
\description{Compute standard errors for person fit statistics.}

\usage{
PerFit.SE(x)
}

\arguments{
  \item{x}{Object of class "PerFit".}
}

\details{
Function \code{PerFit.SE} computes jackknife standard errors for the scores of the person fit statistic in object \code{x}.
}

\value{
A matrix with two columns: \code{PFscores} shows the values of the person-fit statistic and \code{PFscores.SE} shows the estimated standard errors.
}

\author{Jorge N. Tendeiro \email{tendeiro@hiroshima-u.ac.jp}}

\examples{
# Load the inadequacy scale data (dichotomous item scores):
data(InadequacyData)

# Compute the Ht scores:
Ht.out <- Ht(InadequacyData)

# Compute the SEs:
Ht.SE <- PerFit.SE(Ht.out)
Ht.SE

}
\keyword{univar}
