library(plumber)

#* @apiTitle Probability Distribution Generator

#* Generate probabilities distributions
#* @param y Dataset
#* @post /fit.prob
fit.prob <- function(y){

  y <- as.numeric(y)
  
  if ("fitdistrplus" %in% rownames(installed.packages()) == T) {
    
    if (TRUE %in% (y < 0) == F) {
      
      norm    <- fitdistrplus::fitdist(y, distr = "norm")
      gamma   <- fitdistrplus::fitdist(y, distr = "gamma")
      weibull <- fitdistrplus::fitdist(y, distr = "weibull")
      lnorm   <- fitdistrplus::fitdist(y, distr = "lnorm")
      exp     <- fitdistrplus::fitdist(y, distr = "exp")
      
      all_dist <- list(norm,
                       gamma,
                       weibull,
                       lnorm,
                       exp)
      
      legend <- c("norm",
                  "gamma",
                  "weibull",
                  "lnorm",
                  "exp")
      
      results <-
        fitdistrplus::gofstat(all_dist,
                              fitnames = legend,
                              discrete = F)
      
      result <- get(names(sort(results[["aic"]])[1]))

      result <- 
        list(bestFit    = result$distname,
             parameters = as.list(result$estimate),
             stdErros   = as.list(result$sd))
      
      return(result)
      
    }
    
    return("values must be positive to fit multiple distributions")
    
  }
  
  else {
    
    return("fitdistrplus package is not installed")
    
  }
  
}