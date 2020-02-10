## Welcome to the 
##  _______     __ _         _____        _          _           _     
## |__   __|   / _| |       |  __ \      | |        | |         | |    
##    | |_   _| |_| |_ ___  | |  | | __ _| |_ __ _  | |     __ _| |__  
##    | | | | |  _| __/ __| | |  | |/ _` | __/ _` | | |    / _` | '_ \ 
##    | | |_| | | | |_\__ \ | |__| | (_| | || (_| | | |___| (_| | |_) |
##    |_|\__,_|_|  \__|___/ |_____/ \__,_|\__\__,_| |______\__,_|_.__/ 
##
##             Innovate. Analyze. Visualize. | datalab.tufts.edu
##
##  _______________________________________________________________________
##  Metadata: Version: R 3.4.3 and RStudio 1.1.423
##  Title: Consultation on forecast and timeseries regression
##  By: Kyle Monahan
##  Date: 4-25-2018
##  _______________________________________________________________________

##--------------- Setting up packages -----------------

library(forecast)
library(readxl)

##--------------- Import data -----------------
df <- read_excel("~/Downloads/Table1_Cleaned.xlsx")
View(X_Table1_Cleaned)

# Issue with number of obs! 

##--------------- Setting up time series -----------------

# ts = ts(t(df[2,7])) 

## more reading: https://www.statmethods.net/advstats/timeseries.html
## also this is useful: https://robjhyndman.com/talks/MelbourneRUG.pdf



