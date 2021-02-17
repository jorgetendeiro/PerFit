\name{The caution statistic}
\alias{Cstar}
\alias{C.Sato}
\title{C.Sato, Cstar person-fit statistics}
\description{Computes the caution statistic C.Sato and the modified caution statistic Cstar.}
\usage{
C.Sato(matrix,
       NA.method = "Pairwise", Save.MatImp = FALSE, 
       IP = NULL, IRT.PModel = "2PL", Ability = NULL, Ability.PModel = "ML",
       mu = 0, sigma = 1)

Cstar(matrix,
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
The C.Sato statistic (also refered to as C in the literature) was proposed by Sato (1975):
\deqn{C.Sato = 1-\frac{cov(x_n,p)}{cov(x_n^*,p)},}{C.Sato = 1-cov(Xn,p)/cov(Xn*,p),}
where \eqn{x_n}{Xn} is the 0-1 response vector of respondent \eqn{n}, \eqn{p} is the vector of item proportions-correct, and \eqn{x_n^*}{Xn*} is the so-called Guttman vector containing correct answers for the easiest items (i.e., with the largest proportion-correct values) only. C.Sato is zero for Guttman vectors and its value tends to increase for response vectors that depart from the group's answering pattern, hence warning the researcher to be \emph{cautious} about interpreting such item scores. Therefore, (potentially) aberrant response behavior is indicated by large values of C.Sato (i.e., in the right tail of the sampling distribution).

Harnisch and Linn (1981) proposed a modified version of the caution statistic which bounds the caution statistic between 0 and 1 (also referred to as C* or MCI  in the literature):
\deqn{Cstar = \frac{cov(x_n^*,p)-cov(x_n,p)}{cov(x_n^*,p)-cov(x_n',p)},}{Cstar = [cov(Xn*,p)-cov(Xn,p)] / [cov(Xn*,p)-cov(Xn',p)],}
where \eqn{x_n'}{Xn'} is the reversed Guttman vector containing correct answers for the hardest items (i.e., with the smallest proportion-correct values) only. Cstar is sensitive to the so-called Guttman errors. A Guttman error is a pair of scores (0,1), where the 0-score pertains to the easiest item and the 1-score pertains to the hardest item. Cstar ranges between 0 (perfect Guttman vector) and 1 (reversed Guttman error), thus larger values indicate potential aberrant response behavior.

These statistics are not computed for rows of \code{matrix} that consist of only 0s or only 1s (NA values are returned instead).

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
Harnisch, D. L., and Linn, R. L. (1981) Analysis of item response patterns: Questionable test data and dissimilar curriculum practices. \emph{Journal of Educational Measurement}, \bold{18(3)}, 133--146.

Karabatsos, G. (2003) Comparing the Aberrant Response Detection Performance of Thirty-Six Person-Fit Statistics. \emph{Applied Measurement In Education}, \bold{16(4)}, 277--298.

Meijer, R. R., and Sijtsma, K. (2001) Methodology review: Evaluating person fit. \emph{Applied Psychological Measurement}, \bold{25(2)}, 107--135.

Sato, T. (1975) \emph{The construction and interpretation of S-P tables.} Tokyo: Meiji Tosho.

Zhang, B., and Walker, C. M. (2008) Impact of missing data on person-model fit and person trait estimation. \emph{Applied Psychological Measurement}, \bold{32(6)}, 466--479.
}
\author{Jorge N. Tendeiro \email{tendeiro@hiroshima-u.ac.jp}}
\seealso{\code{\link{Ht}}}
\examples{
# Load the inadequacy scale data (dichotomous item scores):
data(InadequacyData)

# Compute the C.Sato scores:
C.out <- C.Sato(InadequacyData)

# Compute the Cstar scores:
Cstar.out <- Cstar(InadequacyData)
}
\keyword{univar}
