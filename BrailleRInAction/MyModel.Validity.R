## ----GetVars, echo=FALSE-------------------------------------------------
Residuals=rstudent(MyModel)
Fits= fitted(MyModel)
Leverages= hatvalues(MyModel)
Cooks= cooks.distance(MyModel)

## ----BasicSummaries------------------------------------------------------
Residuals.count = length(Residuals)
Residuals.unique = length(unique(Residuals))
Residuals.Nobs = sum(!is.na(Residuals))
Residuals.Nmiss = sum(is.na(Residuals))
Residuals.mean = mean(Residuals, na.rm = TRUE)
Residuals.tmean5 = mean(Residuals, trim =0.025, na.rm = TRUE)
Residuals.tmean10 = mean(Residuals, trim =0.05, na.rm = TRUE)
Residuals.IQR = IQR(Residuals, na.rm = TRUE)
Residuals.sd = sd(Residuals, na.rm = TRUE)
Residuals.var = var(Residuals, na.rm = TRUE)
Residuals.skew = moments::skewness(Residuals, na.rm = TRUE)
Residuals.kurt = moments::kurtosis(Residuals, na.rm = TRUE)

## ----Quantiles1----------------------------------------------------------
Quantiles=quantile(Residuals, na.rm=TRUE)
QList=c("Minimum", "Lower Quartile", "Median", "Upper Quartile", "Maximum")
Results=data.frame(Quantile=QList, Value=Quantiles[1:5])

## ----QuantilesPrint, eval=FALSE------------------------------------------
## Results

## ----Hist, fig.cap="The histogram", fig.height=5-------------------------
VI(hist(Residuals, xlab="Residuals", main="Histogram of Residuals"))

## ----Boxplot, fig.cap="The boxplot", fig.height=3.5----------------------
VI(boxplot(Residuals, horizontal=TRUE, main = "Boxplot of Residuals"))

## ----NormalityTests------------------------------------------------------
library(nortest)
Results = matrix(0, nrow=6, ncol=2)
dimnames(Results) = list(c("Shapiro-Wilk", "Anderson-Darling", "Cramer-von Mises",
"Lilliefors (Kolmogorov-Smirnov)", "Pearson chi-square", "Shapiro-Francia"), c("Statistic", "P Value"))
 SW =shapiro.test(Residuals)
Results[1,] = c(SW$statistic, SW$p.value)
AD = ad.test(Residuals)
Results[2,] = c(AD$statistic, AD$p.value)
CV = cvm.test(Residuals)
Results[3,] = c(CV$statistic, CV$p.value)
LI = lillie.test(Residuals)
Results[4,] = c(LI$statistic, LI$p.value)
PE = pearson.test(Residuals)
Results[5,] = c(PE$statistic, PE$p.value)
SF = sf.test(Residuals)
Results[6,] = c(SF$statistic, SF$p.value)

## ----NormalityTestsPrint, eval=FALSE-------------------------------------
## Results

## ----NormPlot, fig.cap="The normality plot", fig.height=7----------------
qqnorm(Residuals, main = "Normality Plot for Residuals")
qqline(Residuals)

## ----MomentsTests--------------------------------------------------------
library(moments)
Results = matrix(0, nrow=2, ncol=3)
dimnames(Results)= list(c( "D'Agostino skewness", "Anscombe-Glynn kurtosis"),
 c("Statistic","Z",  "P Value"))
AG = moments::agostino.test(Residuals)
AN = moments::anscombe.test(Residuals)
Results[1,] = c(AG$statistic, AG$p.value)
Results[2,] = c(AN$statistic, AN$p.value)

## ----MomentsTestsPrint, eval=FALSE---------------------------------------
## Results

## ----Fits, fig.cap="Standardised residuals plotted against fitted values"----
plot(Fits, Residuals)
WhereXY(Fits, Residuals, yDist="normal")

## ----Order, fig.cap="Standardised residuals plotted against order"-------
plot(Residuals)
WhereXY(1:length(Residuals), Residuals, yDist="normal")

## ----Lag1Resids, fig.cap="standardised residuals plotted against lagged residuals"----
n = length(Residuals)
plot(Residuals[-n], Residuals[-1], ylab= paste("Residuals 2 to", n), xlab=paste("Residuals 1 to",(n-1)))
WhereXY(Residuals[-n], Residuals[-1], xDist="normal")

## ----Leverages, fig.cap="Standardised residuals plotted against leverages"----
plot(Leverages, Residuals)
WhereXY(Leverages, Residuals, yDist="normal")

## ----ListInfObs----------------------------------------------------------
InflObs = data.frame(MyModel$model, Fit=Fits, St.residual=Residuals, Leverage=Leverages, Cooks.distance=Cooks)[abs(Residuals)>2 | Cooks > 1 | Leverages > 2*mean(Leverages) , ]

