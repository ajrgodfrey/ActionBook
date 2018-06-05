# commands to process somehow later
library(BrailleR)

Ozone=airquality$Ozone
UniDesc(Ozone, View=FALSE)
rm(Ozone)
# N.B. Various files and a folder were created in the working directory. 
# Please investigate them to see how this function worked.



data(airquality)

# the following line  returns an error:
## OneFactor("Ozone", "Month", airquality, View=FALSE)
# so we make a copy of the data.frame, and fix that:

airquality2 = airquality
airquality2$Month = as.factor(airquality$Month)
# and now all is good to try:
OneFactor("Ozone", "Month", airquality2)
# N.B. Various files and a folder were created in the working directory. 
# Please investigate them to see how this function worked.


MyModel = lm(Ozone~Temp, data=airquality, echo=FALSE)
VI(MyModel)
data(airquality)
OnePredictor("Ozone", "Wind", airquality, View=FALSE)
# N.B. Various files and a folder were created in the working directory. 
# Please investigate them to see how this function worked.


