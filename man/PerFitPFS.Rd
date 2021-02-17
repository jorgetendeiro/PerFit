\name{PerFit.PFS}
\alias{PerFit.PFS}
\title{Compute several person-fit statistics}
\description{Compute several person-fit statistics.}

\usage{
PerFit.PFS(matrix, method=NULL, simplified=TRUE, 
       NA.method = "Pairwise", Save.MatImp = FALSE,
       IP = NULL, IRT.PModel = NULL, Ability = NULL, Ability.PModel = NULL,
       mu = 0, sigma = 1)
}

\arguments{
  \item{matrix}{Data matrix of dichotomous item scores: Persons as rows, items as columns, item scores are either 0 or 1, missing values allowed.}
  \item{method}{Vector of person-fit statistics to be computed.}
  \item{simplified}{Logical. If FALSE, a list of \code{PerFit} objects is returned. If TRUE (default), a matrix with person-fit scores per respondent (one column per statistic) is reported.}
  \item{NA.method}{Method to deal with missing values. The default is pairwise elimination (\code{"Pairwise"}). Alternatively, simple imputation methods are also available. The options available are \code{"Hotdeck"}, \code{"NPModel"} (default), and \code{"PModel"}.}
  \item{Save.MatImp}{Logical. Save (imputted) data matrix to file? Default is FALSE.}
  \item{IP}{Matrix with previously estimated item parameters: One row per item, and three columns ([,1] item discrimination; [,2] item difficulty; [,3] lower-asymptote, also referred to as pseudo-guessing parameter).
  
  In case no item parameters are available then \code{IP=NULL}.}
  \item{IRT.PModel}{Specify the IRT model to use in order to estimate the item parameters (only if \code{IP=NULL}).}
  \item{Ability}{Vector with previoulsy estimated latent ability parameters, one per respondent, following the order of the row index of \code{matrix}.
  
  In case no ability parameters are available then \code{Ability=NULL}.}
  \item{Ability.PModel}{Specify the method to use in order to estimate the latent ability parameters (only if \code{Ability=NULL}).}
  \item{mu}{Mean of the apriori distribution. Only used when \code{method="BM"}. Default is 0.}
  \item{sigma}{Standard deviation of the apriori distribution. Only used when \code{method="BM"}. Default is 1.}
}

\details{
Function \code{PerFit.PFS} is a wrapper allowing to compute more than one person-fit statistic simultaneously.
}

\value{
If \code{simplified=TRUE}, a N-by-m data frame is returned, where N is the number of respondents and m is the number of methods.

If \code{simplified=FALSE} a list of m \code{PerFit} objects is returned.
}

\author{Jorge N. Tendeiro \email{tendeiro@hiroshima-u.ac.jp}}

\examples{
# Load the inadequacy scale data (dichotomous item scores):
data(InadequacyData)

# Compute the lzstar, U3, and Ht scores:
PerFit.PFS(InadequacyData, method=c("lzstar", "U3", "Ht"))
}
\keyword{univar}
