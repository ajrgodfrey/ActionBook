attach(airquality2)
Data.Mean <- tapply(Ozone, Month, mean, na.rm=TRUE)
Data.StDev <- tapply(Ozone, Month, sd, na.rm=TRUE)
nNonMissing <- function(x){
length(na.omit(x)) # length() includes NAs
}
Data.n <- tapply(Ozone, Month, nNonMissing)
Data.StdErr = Data.StDev/sqrt(Data.n)
detach(airquality2)
DataSummary = data.frame(names(Data.Mean), Data.Mean, Data.StDev, Data.n, Data.StdErr)
colnames(DataSummary) = c("Level", "Mean", "Standard deviation", "n", "Standard error")
VI(boxplot(Ozone~Month, data=airquality2, ylab="Ozone", xlab="Month"))  
with(airquality2,
VI(dotplot(Ozone~Month, xlab="Ozone", ylab="Month")))
VI(
MyANOVA <- aov(Ozone~Month, data=airquality2)) 
summary(MyANOVA)
par(mfrow=c(2,2))
plot(MyANOVA)
bartlett.test(Ozone~Month, data=airquality2)
fligner.test(Ozone~Month, data=airquality2)
MyHSD <- TukeyHSD(MyANOVA, ordered=TRUE, conf.level=0.95)
VI(MyHSD)  

MyHSD
plot(MyHSD)
