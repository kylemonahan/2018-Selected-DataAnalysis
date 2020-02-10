library(bkmr)
#read data
setwd("/cluster/tufts/singhlab/yzhao12/dataset")
load("02_prep_data_upload_v7.RData")
df<-df_sub
rm(df_sub)
#take a random sample for testing
#df<-df[sample(1:nrow(df), 800, replace=FALSE),]
exposure<-df[exp_var]
covariate<-df[cor_var] 
outcome<-df[out_var]
outcome<-as.vector(outcome[,1])
#Scale 
exposure<-scale(exposure)
covariate_cont<-scale(covariate[1:3])
covariate<-cbind(covariate_cont,covariate[4:12])
#Speedup
knots100 <- fields::cover.design(exposure, nd = 100)$design
#run bkmr
set.seed(123)
## without speedup
# fitkm <- kmbayes(y = outcome, Z = exposure, X=covariate,  iter = 1800, verbose = TRUE, varsel =TRUE) #, groups = c(1,2,3,4,5,6,7,8,8,8)
##with speedup
fit2 <- mcmc()
fitkm <- kmbayes(y = outcome, Z = exposure, X=covariate,  iter = 1800, verbose = TRUE, varsel =TRUE, knots = knots100) #, groups = c(1,2,3,4,5,6,7,8,8,8)
#export result
save.image("03_result_v7_speedup100.RData")

#Sources from Yi: 
# https://jenfb.github.io/bkmr/overview.html

#Thoughts from meeting: 
# https://stackoverflow.com/questions/23926334/how-do-i-parallelize-in-r-on-windows-example
# https://www.r-bloggers.com/implementing-parallel-processing-in-r/
# https://www.r-bloggers.com/post-10-multicore-parallelism-in-mcmc/
# http://www.unige.ch/ses/sococ/cl/r/reexp.e.html


# Suggestion: 
# 1. Look into Cooks D as a measure of outliers to see if there 
# 2. Look at package car for visualizing transformations
# 3. Look at heatmaps for R http://www.r-graph-gallery.com/215-the-heatmap-function/ 
# 4. Correlation matrix - covariance 

#Thoughts after meeting 

#0. Please show me your process locally. 

#First look - may take some time https://onlinelibrary.wiley.com/doi/full/10.1002/env.2504

# 0.5. Send a script to optimize memory usage.  
# 1. Have you tried adaptMCMC? https://cran.r-project.org/web/packages/adaptMCMC/adaptMCMC.pdf
# 2. Have you tried parallelMCMCombine? https://arxiv.org/ftp/arxiv/papers/1409/1409.2546.pdf

# 3. Check out cooks d - cooks.distance() http://r-statistics.co/Outlier-Treatment-With-R.html
# 4, You can also just use outlier() https://cran.r-project.org/web/packages/outliers/index.html
# 5. General approaches for parallelizing in  R are useful for graphing. https://www.r-bloggers.com/how-to-go-parallel-in-r-basics-tips/

# 6. Iterating 2000 times is not unheard of Park et al 2017 https://ehjournal.biomedcentral.com/track/pdf/10.1186/s12940-017-0310-9 
# 7. Also from Park et al. 2017  - " logarithmic transformation with base 10 to GGT and metal pollutants because the distributions of the raw values were highly skewed and the shapes of dose-response relationships were closer to be linear with log-transformation."


#https://cran.r-project.org/web/packages/fields/fields.pdf
#https://cran.r-project.org/web/packages/adaptMCMC/adaptMCMC.pdf
#https://cran.r-project.org/web/packages/bkmr/bkmr.pdf
#http://adsabs.harvard.edu/abs/2000HEAD....5.1608R
#http://adsabs.harvard.edu/abs/2000HEAD....5.1608R