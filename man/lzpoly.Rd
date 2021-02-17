\name{lzpoly}
\alias{lzpoly}
\title{lzpoly person-fit statistic}
\description{Compute the lzpoly (Drasgow, Levine, and Williams, 1985) person-fit statistic.}

\usage{
lzpoly(matrix, Ncat, 
       NA.method = "Pairwise", Save.MatImp = FALSE,
       IP = NULL, IRT.PModel = "GRM", Ability = NULL, Ability.PModel = "EAP")
}

\arguments{
  \item{matrix}{A data matrix of polytomous item scores: Persons as rows, items as columns, item scores are integers between 0 and (Ncat-1), missing values allowed.}
  \item{Ncat}{Number of answer options for each item.}
  \item{NA.method}{Method to deal with missing values. The default is pairwise elimination (\code{"Pairwise"}). Alternatively, simple imputation methods are also available. The options available are \code{"Hotdeck"}, \code{"NPModel"} (default), and \code{"PModel"}.}
  \item{Save.MatImp}{Logical. Save (imputted) data matrix to file? Default is FALSE.}
  \item{IP}{Matrix with previously estimated item parameters: One row per item. The first (Ncat-1) columns contain the between-categories threshold parameters (for the GRM) or the item step difficulties (for the PCM and the GPCM). The last, Ncat-th, column has the slopes.
  
  In case no item parameters are available then \code{IP=NULL}.}
  \item{IRT.PModel}{Specify the IRT model to use in order to estimate the item parameters (only if \code{IP=NULL}). The options available are \code{"PCM"}, \code{"GPCM"}, and \code{"GRM"} (default).}
  \item{Ability}{Vector with previoulsy estimated latent ability parameters, one per respondent, following the order of the row index of \code{matrix}.
  
  In case no ability parameters are available then \code{Ability=NULL}.}
  \item{Ability.PModel}{Specify the method to use in order to estimate the latent ability parameters (only if \code{Ability=NULL}). The options available are \code{"EB"}, \code{"EAP"} (default), and \code{"MI"}.}
}

\details{
Statistic \code{lzpoly} is the natural extension of \code{\link{lz}} to polytomously scores items. In this case the user can choose one from three possible IRT models to fit the data: The partial credit model (\code{IRT.PModel="PCM"}), the generalized partial credit model (\code{IRT.PModel="GPCM"}), or the graded response model (\code{IRT.PModel="GRM"}). Ability parameters can be estimated by means of one of three methods: Empirical Bayes (\code{Ability.PModel="EB"}), expected a posteriori (\code{Ability.PModel="EAP"}), or multiple imputation (\code{Ability.PModel="MI"}).

The estimation of the model parameters is based on the \code{ltm} package. This function will estimate the item and ability parameters when both sets of parameters are missing. It will also estimate one set of parameters in case only the other set is provided. It is possible that some estimation convergence problems occur that may break the function. In this case it is advisable to estimate the model parameters externally and then to run this function with those estimates provided via the commands \code{IP} and \code{Ability}.

Aberrant response behavior is (potentially) indicated by small values of lzpoly (i.e., in the left tail of the sampling distribution).

Missing values in \code{matrix} are dealt with by means of pairwise elimination by default. Alternatively, single imputation is also available. Three single imputation methods exist: Hotdeck imputation (\code{NA.method = "Hotdeck"}), nonparametric model imputation (\code{NA.method = "NPModel"}), and parametric model imputation (\code{NA.method = "PModel"}); see Zhang and Walker (2008). 
\itemize{
\item Hotdeck imputation replaces missing responses of an examinee ('recipient') by item scores from the examinee which is closest to the recipient ('donor'), based on the recipient's nonmissing item scores. The similarity between nonmissing item scores of recipients and donors is based on the sum of absolute differences between the corresponding item scores. The donor's response pattern is deemed to be the most similar to the recipient's response pattern in the group, so item scores of the former are used to replace the corresponding missing values of the latter. When multiple donors are equidistant to a recipient, one donor is randomly drawn from the set of all donors.
\item The nonparametric model imputation method is similar to the hotdeck imputation, but item scores are generated from multinomial distributions with probabilities defined by donors with similar total score than the recipient (based on all items except the NAs).
\item The parametric model imputation method is similar to the hotdeck imputation, but item scores are generated from multinomial distributions with probabilities estimated by means of parametric IRT models (\code{IRT.PModel = "PCM"}, \code{"GPCM"}, or \code{"GRM"}). Item parameters (\code{IP}) and ability parameters (\code{Ability}) may be provided for this purpose (otherwise the algorithm finds estimates for these parameters).
}
}

\value{
An object of class "PerFit", which is a list with 12 elements:
  \item{PFscores}{A list of length \eqn{N} (number of respondents) with the values of the person-fit statistic.}
  \item{PFstatistic}{The person-fit statistic used.}
  \item{PerfVects}{Not applicable.}
  \item{ID.all0s}{Not applicable.}
  \item{ID.all1s}{Not applicable.}
  \item{matrix}{The data matrix after imputation of missing values was performed (if applicable).}
  \item{Ncat}{The number of response categories.}
  \item{IRT.PModel}{The parametric IRT model used.}
  \item{IP}{The \eqn{I}xNcat matrix of estimated item parameters.}
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
\seealso{\code{\link{lz}},\code{\link{lzstar}}}
\examples{
# Load the physical functioning data (polytomous item scores):
data(PhysFuncData)

# Compute the lzpoly scores:
lzpoly.out <- lzpoly(PhysFuncData,Ncat=3)
}
\keyword{univar}
