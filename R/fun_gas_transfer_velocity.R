# Gas transfer velocity calculation
#
# Adapted from Matlab to R by Jill Arriola, 2021-03-16
#
# THIS FUNCTION CALCULATES THE GAS TRANSFER VELOCITY ACROSS THE AIR-SEA
# INTERFACE FOR OXYGEN BASED ON THE WANNINKHOF (2014) EQUATION
#
# Reference:
# WANNINKHOF, R., LIMNOLOGY AND OCEANOGRAPHY METHODS, 12(6), 351-362, 2014.
#
# INPUTS ARE
# sc = Schmidt number (unitless)
# wspd2 = Windspeed squared (m^2/s^2)
# **Inputs come from fwoxy.R as vectors**
#
# OUTPUT IS kw (m/s)
#'
#' @param sc
#' @param wspd2
#'
#' @return kw (m/s)
#' @export
#'
fun_gas_transfer_velocity <- function(sc, wspd2){

  a <- 0.251 # DO NOT CHANGE


  kw <- a * wspd2 * ((sc / 660) ^(-0.5)) # cm/hr
  kw  <- kw/(100*60*60) # convert from cm/hr to m/s

return(kw)

}


