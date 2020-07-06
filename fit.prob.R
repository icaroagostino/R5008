library(fitdistrplus)

fit.prob <- function(y){
  
  y <- as.numeric(y)
  
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
  
  return(result)
  
}
