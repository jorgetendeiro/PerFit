\name{lz, lzstar}
\alias{lz}
\alias{lzstar}
\title{lz and lzstar person-fit statistics}
\description{Compute the lz (Drasgow, Levine, and Williams, 1985) and the lzstar (Snijders, 2001) person-fit statistics.}

\usage{
lz(matrix,
   NA.method = "Pairwise", Save.MatImp = FALSE,
   IP = NULL, IRT.PModel = "2PL", Ability = NULL, Ability.PModel = "ML",
   mu = 0, sigma = 1)

lzstar(matrix,
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
Drasgow et al. (1985) introduced one of the most used person-fit statistics, \code{lz}. This statistic is the standardized log-likelihood of the respondent's response vector. \code{lz} is (supposed to be) asymptotically standard normally distributed. 

The computation of \code{lz} requires that both item and ability parameters are available. Function \code{lz} allows to user to enter his/her own item and ability parameter estimates (variables \code{IP} and \code{Ability}, respectively). Alternatively, \code{lz} relies on functions available through the \code{\link[irtoys]{irtoys}} package for estimating the parameters. Specifically, the user can choose one from three possible IRT models to fit the data: \code{IRT.PModel="1PL"}, \code{IRT.PModel="2PL"}, or \code{IRT.PModel="3PL"}. As for estimating the ability parameters there are three possible methods: \code{Ability.PModel="ML"} (maximum likelihood), \code{Ability.PModel="BM"} (Bayes modal), or \code{Ability.PModel="WL"} (weighted likelihood).

It was later observed by several researchers (e.g., Molenaar and Hoijtink, 1990) that the asymptotic approximation only holds when true ability values are used. This limitation was overcome by Snijders (2001), who further developed \code{lz} into the \code{lzstar} statistic. An accessible paper that thoroughly explains the basic principles behind \code{lzstar} is Magis, Raiche, and Beland (2012). It is important to realize that not all item and/or ability estimation procedures can be used when computing \code{lzstar}. In particular, the estimation of the ability parameters is constrained (see Snijders, 2001, Equation 5). The \code{lzstar} algorithm internally estimates the ability parameters accordingly for one of three possible methods: \code{Ability.PModel="ML"} (maximum likelihood), \code{Ability.PModel="BM"} (Bayes modal), or \code{Ability.PModel="WL"} (weighted likelihood), see Magis et al. (2012). The user may provide his or her own ability estimates in case they are available by means of other software. In this case it is necessary to specify the method that was used for the estimation (ML, BM, or WL) using the argument \code{Ability.PModel}.

Aberrant response behavior is (potentially) indicated by small values of lz/lzstar (i.e., in the left tail of the sampling distribution).

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
  \item{IRT.PModel}{The parametric IRT model used.}
  \item{IP}{The \eqn{I}x3 matrix of estimated item parameters.}
  \item{Ability.PModel}{The method used to estimate abilities used.}
  \item{Ability}{The vector of \eqn{N} estimated ability parameters.}
  \item{NAs.method}{The imputation method used (if applicable).}
}

\references{
Drasgow, F., Levine, M. V., and Williams, E. A. (1985) Appropriateness measurement with polychotomous item response models and standardized indices. \emph{British Journal of Mathematical and Statistical Psychology}, \bold{38(1)}, 67--86.

Karabatsos, G. (2003) Comparing the Aberrant Response Detection Performance of Thirty-Six Person-Fit Statistics. \emph{Applied Measurement In Education}, \bold{16(4)}, 277--298.

Magis, D., Raiche, G., and Beland, S. (2012) A didactic presentation of Snijders's l[sub]z[/sub] index of person fit with emphasis on response model selection and ability estimation. \emph{Journal of Educational and Behavioral Statistics}, \bold{37(1)}, 57--81.

Meijer, R. R., and Sijtsma, K. (2001) Methodology review: Evaluating person fit. \emph{Applied Psychological Measurement}, \bold{25(2)}, 107--135.

Molenaar, I. W., and Hoijtink, H. (1990) The many null distributions of person fit indices. \emph{Psychometrika}, \bold{55(1)}, 75--106. 

Snijders, T. B. (2001) Asymptotic null distribution of person fit statistics with estimated person parameter. \emph{Psychometrika}, \bold{66(3)}, 331--342. 

Zhang, B., and Walker, C. M. (2008) Impact of missing data on person-model fit and person trait estimation. \emph{Applied Psychological Measurement}, \bold{32(6)}, 466--479.
}
\author{Jorge N. Tendeiro \email{tendeiro@hiroshima-u.ac.jp}}
\seealso{\code{\link{lzpoly}}}
\examples{
# Load the inadequacy scale data (dichotomous item scores):
data(InadequacyData)

# Compute the lz scores using a subsample of the first 200 response vectors:
lz.out <- lz(InadequacyData[1:200,])
# Use parameters estimated externally (in this case item parameters estimated by mirt):
mod <- mirt(InadequacyData[1:200,], 1)
ip.mirt <- coef(mod, IRTpars = TRUE, simplify = TRUE, digits = Inf)$items[,c('a', 'b', 'g')]
lz.out2 <- lz(InadequacyData[1:200,], IP = ip.mirt)

# Compute the lzstar scores using a subsample of the first 200 response vectors:
lzstar.out <- lzstar(InadequacyData[1:200,])
}
\keyword{univar}
