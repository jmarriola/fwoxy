#' Sin model of PAR
#'
#' @details
#'
#' Adapated from Matlab to R by Jill Arriola, 2021-03-16
#'
#' IDEALIZED SIN MODEL OF PHOTOSYNTHETIC ACTIVE RADIATION (PAR) IN MILITARY TIME
#' BASED ON DATA RETRIEVED FROM APALACHICOLA BAY, FLORIDA, 2012
#'
#' Max = 400 W/m^2 at 12:00 and zero PAR between 18:00 and 6:00
#'
#' INPUT: time (seconds) starting at midnight on day 1
#' OUTPUT: par (W/m^2)
#'
#' @param t numeric for time
#'
#' @return PAR (W/m^2)
#' @export
#'
fun_par_sin_model <- function(t){

  sph <- 60 * 60 # seconds per hour

  par_amplitude <- 400 # par value at noon, W/m2
  Tperiod_hr <- 24  # period of the sin wave in hr
  tshift_hr <- -6 # I want the peak at t=12 (pi) instead of t=6 (x=pi/2)


  Tperiod <- Tperiod_hr * sph  # seconds in a 24 hour period
  tshift <- tshift_hr * sph

  freq <- 1/Tperiod
  omega <- 2*pi*freq
  x <- omega*(t + tshift)
  par <- par_amplitude*sin(x)

  par[par < 0] <- 0  # makes negative results = 0

  return(par)

}






