# Adapted from Matlab code to R, Jill Arriola, 2021-03-16
# Calculate kw
fun_gas_transfer_velocity <- function(sc, wspd2){
  
  a <- 0.251 # DO NOT CHANGE ~ Wanninkhof 2014 
  
  
  kw <- a * wspd2 * ((sc / 660) ^(-0.5)) # cm/hr
  kw  <- kw/(100*60*60) # convert from cm/hr to m/s
  
return(kw)
  
}


