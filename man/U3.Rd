\name{U3, ZU3}
\alias{U3}
\alias{ZU3}
\title{U3, ZU3 person-fit statistics}
\description{van der Flier's U3 and ZU3 person-fit statistics.}

\usage{
U3(matrix,
   NA.method = "Pairwise", Save.MatImp = FALSE, 
   IP = NULL, IRT.PModel = "2PL", Ability = NULL, Ability.PModel = "ML",
   mu = 0, sigma = 1)

ZU3(matrix,
    NA.method = "Pairwise", Save.MatImp = FALSE, 
    IP = NULL, IRT.PModel = "2PL", Ability = NULL, Ability.PModel = "ML",
    mu = 0, sigma = 1)
}

\arguments{
  \item{matrix}{Data matrix of dichotomous item scores: Persons as rows, items as columns, item scores are either 0 or 1, missing values allowed.}
  \item{NA.method}{Method to deal with missing values. The default is pairwise elimination (\code{"Pairwise"}). Alternatively, simple imputation methods are also available. The options available are \code{"Hotdeck"}, \code{"NPModel"} (default), and \code{"PModel"}.}
  \item{Save.MatImp}{Logical. Save (imputted) data matrix to file? Default is FALSE.}
  \item{IP}{Matrix with previously estimated item parameters: One row per item, and three columns ([,1] item discrimination; [,2] item difficulty; [,3] lower-asymptote, also referred to as pseudo-guessing parameter).
  
  In case no item parameters are available then \code{IP=NULL}.}
  \item{IRT.PModel}{Specify the IRT model to use in order to estimate the item parameters (only if \code{IP=NULL}). The options available are \code{"1PL"}, \code{"2PL"} (default), and \code{"3PL"}.}
  \item{Ability}{Vector with previoulsy estimated latent ability parameters, one per respondent, following the order of the row index of \code{matrix}.
  
  In case no ability parameters are available then \code{Ability=NULL}.}
  \item{Ability.PModel}{Specify the method to use in order to estimate the latent ability parameters (only if \code{Ability=NULL}). The options available are \code{"ML"} (default), \code{"BM"}, and \code{"WL"}.}
  \item{mu}{Mean of the apriori distribution. Only used when \code{method="BM"}. Default is 0.}
  \item{sigma}{Standard deviation of the apriori distribution. Only used when \code{method="BM"}. Default is 1.}
}

\details{
Suppose the items are ordered in decreasing proportion-correct score, \eqn{p_1>p_2>\ldots>p_I}{p1>p2>...>pI} (\eqn{I} = number of items). Given response vector \eqn{(X_1,X_2,\ldots,X_I)}{(X1,X2,...,XI)} with total score \eqn{S=\sum_iX_i}{S=sum(Xi; i=1,...,I)}, van der Flier (1980, 1982) defined the U3 statistic as
\deqn{\frac{\sum_{i=1}^S p_i-\sum_{i=1}^I p_i}{\sum_{i=1}^S p_i-\sum_{i=I-S+1}^I p_i}.}{
[sum(pi; i=1,...,S) - sum(pi; i=1,...,I)] / [sum(pi; i=1,...,S) - sum(pi; i=I-S+1,...,I)].}

U3 varies from 0 for perfect Guttman response vectors (i.e., with only the easiest items correct) through 1 for reversed Guttman response vectors (i.e., with only the hardest items correct). Hence, increasingly large U3 values provide stronger indications of answering misfit. 

U3 scores are dependent on the number-correct score, hence van der Flier proposed ZU3 as a standardization (formulas to compute E(U3) and Var(U3) can be found in van der Flier, 1982). ZU3 is supposed to be asymptotically approximated by the standard normal distribution, but this approximation is not without problems (see Emons, Meijer, and Sijtsma, 2002).

Missing values in \code{matrix} are dealt with by means of pairwise elimination by default. Alternatively, single imputation is also available. Three single imputation methods exist: Hotdeck imputation (\code{NA.method = "Hotdeck"}), nonparametric model imputation (\code{NA.method = "NPModel"}), and parametric model imputation (\code{NA.method = "PModel"}); see Zhang and Walker (2008). 
\itemize{
\item Hotdeck imputation replaces missing responses of an examinee ('recipient') by item scores from the examinee which is closest to the recipient ('donor'), based on the recipient's nonmissing item scores. The similarity between nonmissing item scores of recipients and donors is based on the sum of absolute differences between the corresponding item scores. The donor's response pattern is deemed to be the most similar to the recipient's response pattern in the group, so item scores of the former are used to replace the corresponding missing values of the latter. When multiple donors are equidistant to a recipient, one donor is randomly drawn from the set of all donors.
\item The nonparametric model imputation method is similar to the hotdeck imputation, but item scores are generated from Bernoulli distributions with probabilities defined by donors with similar total score than the recipient (based on all items except the NAs).
\item The parametric model imputation method is similar to the hotdeck imputation, but item scores are generated from Bernoulli distributions with probabilities estimated by means of parametric IRT models (\code{IRT.PModel = "1PL"}, \code{"2PL"}, or \code{"3PL"}). Item parameters (\code{IP}) and ability parameters (\code{Ability}) may be provided for this purpose (otherwise the algorithm finds estimates for these parameters).
}
}

\value{
An object of class "PerFit", which is a list with 12 elements:
  \item{PFscores}{A list of length \eqn{N} (number of respondents) with the values of the person-fit statistic.}
  \item{PFstatistic}{The person-fit statistic used.}
  \item{PerfVects}{A message indicating whether perfect response vectors (all-0s or all-1s) were removed from the analysis.}
  \item{ID.all0s}{Row indices of all-0s response vectors removed from the analysis (if applicable).}
  \item{ID.all1s}{Row indices of all-1s response vectors removed from the analysis (if applicable).}
  \item{matrix}{The data matrix after imputation of missing values was performed (if applicable).}
  \item{Ncat}{The number of response categories (2 in this case).}
  \item{IRT.PModel}{The parametric IRT model used in case \code{NA.method="PModel"}, otherwise \code{NULL}.}
  \item{IP}{The \eqn{I}x3 matrix of estimated item parameters in case \code{NA.method="PModel"}, otherwise \code{NULL}.}
  \item{Ability.PModel}{The method used to estimate abilities in case \code{NA.method="PModel"}, otherwise \code{NULL}.}
  \item{Ability}{The vector of \eqn{N} estimated ability parameters in case \code{NA.method="PModel"}, otherwise \code{NULL}.}
  \item{NAs.method}{The imputation method used (if applicable).}
}

\references{
Emons, W. M., Meijer, R. R., and Sijtsma, K. (2002). Comparing simulated and theoretical sampling distributions of the U3 person-fit statistic. \emph{Applied Psychological Measurement}, \bold{26(1)}, 88--108.

Karabatsos, G. (2003) Comparing the Aberrant Response Detection Performance of Thirty-Six Person-Fit Statistics. \emph{Applied Measurement In Education}, \bold{16(4)}, 277--298.

Meijer, R. R., and Sijtsma, K. (2001) Methodology review: Evaluating person fit. \emph{Applied Psychological Measurement}, \bold{25(2)}, 107--135.

van der Flier, H. (1980) \emph{Vergelijkbaarheid van individuele testprestaties} [Comparability of individual test performance]. Lisse: The Netherlands.

van der Flier, H. (1982) Deviant response patterns and comparability of test scores. \emph{Journal of Cross-Cultural Psychology}, \bold{13(3)}, 267--298.

Zhang, B., and Walker, C. M. (2008) Impact of missing data on person-model fit and person trait estimation. \emph{Applied Psychological Measurement}, \bold{32(6)}, 466--479.
}
\author{Jorge N. Tendeiro \email{j.n.tendeiro@rug.nl}}
\seealso{\code{\link{U3poly}}}
\examples{
# Load the inadequacy scale data (dichotomous item scores):
data(InadequacyData)

# Compute the U3 scores:
U3.out <- U3(InadequacyData)

# Compute the ZU3 scores:
ZU3.out <- ZU3(InadequacyData)
}
\keyword{univar}
