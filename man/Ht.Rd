\name{Ht statistic}
\alias{Ht}
\title{Ht person-fit statistic}
\description{Sijtsma's Ht person-fit statistic.}

\usage{
Ht(matrix,
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
Sijtsma (1986) adapted a statistic introduced by Mokken (1971) that originally allowed assessing the scalability of an item to the Guttman (1944, 1950) model. The same statistic was applied by Sijtsma to the \emph{transposed} data in order to detect respondents that would not comply with the Guttman model. Assume, without loss of generality, that the rows of the data matrix are ordered by increasing order of total score \eqn{S_n}{Sn} (\eqn{n=1,\ldots,N}{n = 1,..., N}). The statistic formula is given by the ratio
\deqn{Ht=\frac{cov(x_n,r_{(n)})}{cov_{max}(x_n,r_{(n)})},}{Ht=Cov(Xn,R(n)) / Cov.max(Xn,R(n)),}
where \eqn{r_{(n)}}{R(n)} is the vector of total item scores computed \emph{excluding} respondent \eqn{n} and the denominator is the maximum covariance given the marginal. Hence, Ht is actually similar to Sato's \link{C.Sato}. 

Ht is maximum 1 for respondent \eqn{n} when no respondent with a total score smaller/larger than \eqn{S_n}{Sn} can answer an item correctly/incorrectly that respondent \eqn{n} has answered incorrectly/correctly, respectively. Ht equals zero when the average covariance of the response pattern of respondent \eqn{n} with the other response patterns equals zero. Hence, (potentially) aberrant response behavior is indicated by small values of Ht (i.e., in the left tail of the sampling distribution). The Ht statistic was shown to perform relatively well in several simulation studies (Karabatsos, 2003; Sijtsma, 1986; Sijtsma and Meijer, 1992, Tendeiro and Meijer, 2014).

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
Guttman, L. (1944) A basis for scaling qualitative data. \emph{American Sociological Review}, \bold{9}, 139-150.

Guttman, L. (1950) The basis for scalogram analysis. In S. A. Stouffer, L. Guttman, E. A. Suchman, P. F. Lazarsfeld, S. A. Star & J. A. Claussen (Eds.), \emph{Measurement and precision} (pp. 60-90). Princeton NJ: Princeton University Press.

Karabatsos, G. (2003) Comparing the Aberrant Response Detection Performance of Thirty-Six Person-Fit Statistics. \emph{Applied Measurement In Education}, \bold{16(4)}, 277--298.

Mokken, R. J. (1971) \emph{A theory and procedure of scale analysis.} Berlin, Germany: De Gruyter.

Sijtsma, K. (1986) A coefficient of deviance of response patterns. \emph{Kwantitatieve Methoden}, \bold{7}, 131--145.

Sijtsma, K., and Meijer, R. R. (1992) A method for investigating the intersection of item response functions in Mokken's nonparametric IRT model. \emph{Applied Psychological Measurement}, \bold{16(2)}, 149-157.

Tendeiro, J. N., and Meijer, R. R. (2014) Detection of Invalid Test Scores: The Usefulness of Simple Nonparametric Statistics. \emph{Journal of Educational Measurement}, \bold{51(3)}, 239-259.

Zhang, B., and Walker, C. M. (2008) Impact of missing data on person-model fit and person trait estimation. \emph{Applied Psychological Measurement}, \bold{32(6)}, 466--479.
}
\author{Jorge N. Tendeiro \email{tendeiro@hiroshima-u.ac.jp}}
\seealso{\code{\link{C.Sato}}}
\examples{
# Load the inadequacy scale data (dichotomous item scores):
data(InadequacyData)

# Compute the Ht scores:
Ht.out <- Ht(InadequacyData)
}
\keyword{univar}
