\name{PerFit-package}
\alias{PerFit-package}
\alias{PerFit}
\docType{package}

\title{
\packageTitle{PerFit}
}

\description{
Person fit consists of a set of techniques aimed at detecting unusual responses to tests or questionnaires. There are several person-fit statistics available in the literature, see Karabatsos (2003) and Meijer and Sijtsma (2001) for comprehensive reviews. Both dichotomous and polytomous types of items are considered. This R-package outputs the values of the chosen person-fit statistic, the IDs of the respondents that were flagged, and plots the sample distribution of the scores of the person-fit statistic. Nonparametric person response functions (Sijtsma and Meijer, 2001) may also be requested in order to help interpreting individual answering behaviors (dichotomous data only).
}

\details{
\packageDESCRIPTION{PerFit}
\packageIndices{PerFit}
The \pkg{PerFit} package contains several person-fit functions. The goal is to detect response vectors that seem to be strange in terms of the sample of respondents or in terms to an item response theory (IRT) model.

There are many person-fit statistics available in the literature. Statistics are typically categorized according to the type of items (Dicho = dichotomous, Poly = polytomous) and the type of IRT model (NParam=nonparametric, Param=parametric) that they apply to. The current version of \pkg{PerFit} includes the following statistics:
\tabular{llcc}{
\bold{Person-fit statistic (R function)}  \tab \bold{Reference}      \tab \bold{Type item} \tab \bold{Type IRT model}\cr
\code{\link{r.pbis}}        \tab Donlon and Fisher (1968)             \tab Dicho            \tab NParam\cr
\code{\link{C.Sato}}        \tab Sato (1975)                          \tab Dicho            \tab NParam\cr
\code{\link{G}}, \code{\link{Gnormed}} \tab van der Flier (1977), Meijer (1994)  \tab Dicho            \tab NParam\cr
\code{\link{A.KB}}, \code{\link{D.KB}}, \code{\link{E.KB}} \tab Kane and Brennan (1980) \tab Dicho \tab NParam\cr
\code{\link{U3}}, \code{\link{ZU3}} \tab van der Flier (1980, 1982)           \tab Dicho            \tab NParam\cr
\code{\link{Cstar}}         \tab Harnisch and Linn (1981)             \tab Dicho            \tab NParam\cr
\code{\link{NCI}}           \tab Tatsuoka and Tatsuoaka (1982, 1983)  \tab Dicho            \tab NParam\cr
\code{\link{lz}}            \tab Drasgow, Levine, and Williams (1985) \tab Dicho            \tab Param\cr
\code{\link{lzpoly}}        \tab Drasgow, Levine, and Williams (1985) \tab Poly             \tab Param\cr
\code{\link{Ht}}            \tab Sijtsma (1986)                       \tab Dicho            \tab NParam\cr
\code{\link{Gpoly}}        \tab Molenaar (1991)                      \tab Poly             \tab NParam\cr
\code{\link{Gnormed.poly}} \tab Molenaar (1991), Emons (2008)        \tab Poly             \tab NParam\cr
\code{\link{lzstar}}        \tab Snijders (2001)                      \tab Dicho            \tab Param\cr
\code{\link{U3poly}}        \tab Emons (2008)                         \tab Poly             \tab NParam\cr
}
All functions above have an output of class \code{PerFit}.

The package provides other functions that help analyzing the data when conducting person-fit analyses:
\tabular{ll}{
\bold{Function}                           \tab \bold{Description}\cr
\code{\link{cutoff}}                      \tab Estimate cutoff values for the person-fit statistics, to be used as decision rules.\cr
\code{\link{flagged.resp}}                \tab Identify which respondents were flagged according to the chosen cutoff.\cr
\code{\link{plot}} (class \code{PerFit})  \tab Plot the distribution of person-fit scores with the cutoff superimposed.\cr
\code{\link{PRFplot}}                     \tab Plot the nonparametric person response function (Sijtsma and Meijer, 2001).
}

More person-fit statistics will be added to the package in future updates.

\bold{Versions}
\itemize{
\item Version 1.0 (April 2014)
\item Version 1.1 (May 2014)

Functions \code{plot.PerFit} and \code{PRFplot} now allow the user to edit the axes labels and the titles.
\item Version 1.2 (August 2014)

Some output values of some functions were renamed for the sake of consistency. The package documentation was adapted accordingly.

\item Version 1.3 (March 2015)

The package underwent a major revision:
\itemize{
\item Class \code{PerFit} now consists of a list with 12 objects.
\item New methods for objects of class \code{PerFit} were added (\code{summary}, \code{print}).
\item Routines accomodating for missing values were added.
\item Function \code{cutoff} was updated. Now, model-fitting item response patterns are generated in order to find the cutoff value.
\item Function \code{plot.PerFit} now allows displaying a bootstrap percentile confidence interval for the cutoff statistic, as well as ticks marking the flagged respondents.
\item Person response functions are now approximated by functional data objects computed by means of the \code{fda} package. The functional data objects are returned to the user.
\item Standard errors for the person-fit statistics are now available (see function \code{PerFit.SE}).
\item Many control checks were added throughout the entire code.
}
\item Version 1.4 (July 2015)

\itemize{
\item The default missing values approach is now pairwise elimination. The imputation methods introduced with version 1.3.1 are still available.
\item A bug was removed from function \code{lzpoly()} (many thanks to Marco Bressan for spotting it!).
\item The PerFit-package.Rd file was updated (version 1.4.2).
\item A bug in function \code{U3poly} was fixed (version 1.4.3, October 2018). All credit goes to Marek Muszynski for spotting the issue.
}
}
}
\author{
\packageAuthor{PerFit}

Maintainer: \packageMaintainer{PerFit}
}
\references{
Donlon, T. F., and Fischer, F. E. (1968) An index of an individual's agreement with group-defined item difficulties. \emph{Educational and Psychological Measurement}, \bold{28(1)}, 105--113.

Drasgow, F., Levine, M. V., and Williams, E. A. (1985) Appropriateness measurement with polychotomous item response models and standardized indices. \emph{British Journal of Mathematical and Statistical Psychology}, \bold{38(1)}, 67--86.

Emons, W. M. (2008) Nonparametric person-fit analysis of polytomous item scores. \emph{Applied Psychological Measurement}, \bold{32(3)}, 224--247. 

Harnisch, D. L., and Linn, R. L. (1981) Analysis of item response patterns: Questionable test data and dissimilar curriculum practices. \emph{Journal of Educational Measurement}, \bold{18(3)}, 133--146.

Kane, M. T., and Brennan, R. L. (1980) Agreement coefficients as indices of dependability for domain-referenced tests. \emph{Applied Psychological Measurement}, \bold{4(1)}, 105--126.

Karabatsos, G. (2003) Comparing the Aberrant Response Detection Performance of Thirty-Six Person-Fit Statistics. \emph{Applied Measurement In Education}, \bold{16(4)}, 277--298.

Meijer, R. R. (1994) The number of Guttman errors as a simple and powerful person-fit statistic. \emph{Applied Psychological Measurement}, \bold{18(4)}, 311--314.

Meijer, R. R., and Sijtsma, K. (2001) Methodology review: Evaluating person fit. \emph{Applied Psychological Measurement}, \bold{25(2)}, 107--135.

Molenaar, I. W. (1991) A weighted Loevinger H-coefficient extending Mokken scaling to multicategory items. \emph{Kwantitatieve Methoden}, \bold{12(37)}, 97--117.

Sato, T. (1975) \emph{The construction and interpretation of S-P tables.} Tokyo: Meiji Tosho.

Sijtsma, K. (1986) A coefficient of deviance of response patterns. \emph{Kwantitatieve Methoden}, \bold{7}, 131--145.

Sijtsma, K., and Meijer, R. R. (2001) The person response function as a tool in person-fit research. \emph{Psychometrika}, \bold{66(2)}, 191--207. 

Snijders, T. B. (2001) Asymptotic null distribution of person fit statistics with estimated person parameter. \emph{Psychometrika}, \bold{66(3)}, 331--342. 

Tatsuoka, K. K., and Tatsuoka, M. M. (1982) Detection of aberrant response patterns and their effect on dimensionality. \emph{Journal of Educational Statistics}, \bold{7(3)}, 215--231.

Tatsuoka, K. K., and Tatsuoka, M. M. (1983) Spotting erroneous rules of operation by the individual consistency index. \emph{Journal of Educational Measurement}, \bold{20(3)}, 221--230.

Tendeiro, J. N., Meijer, R. R., and Niessen, A. S. M. (2016). PerFit: An R Package for Person-Fit Analysis in IRT. \emph{Journal of Statistical Software}, \bold{74(5)}, 1--27.

van der Flier, H. (1977) Environmental factors and deviant response patterns. In Y. H. Poortinga (Ed.), \emph{Basic problems in cross-cultural psychology.} Amsterdam: The Netherlands.

van der Flier, H. (1980) \emph{Vergelijkbaarheid van individuele testprestaties} [Comparability of individual test performance]. Lisse: The Netherlands.

van der Flier, H. (1982) Deviant response patterns and comparability of test scores. \emph{Journal of Cross-Cultural Psychology}, \bold{13(3)}, 267--298.
}

\examples{

# Load the inadequacy scale data (dichotomous item scores):
data(InadequacyData)

# As an example, compute the Ht person-fit scores:
Ht.out <- Ht(InadequacyData)
# Ht.out$PFscores

# Compute the cutoff value at 1% level:
set.seed(124) # To fix the random seed generator.
Ht.cut <- cutoff(Ht.out, Blvl=.01)

# Plot the sample distribution of the Ht scores with the above cutoff superimposed:
plot(Ht.out, cutoff.obj=Ht.cut)

# Determine which respondents were flagged by Ht at 1% level:
flagged.resp(Ht.out, cutoff.obj=Ht.cut, scores=FALSE)
# Flagged respondents: 30, 37, 46, 49,...

# Plot the person response function of respondent 30 (flagged as aberrant):
Resp30 <- PRFplot(InadequacyData, respID=30)
# Plot the person response function of respondent 35 (not flagged as aberrant):
Resp35 <- PRFplot(InadequacyData, respID=35)
}
