# Oxygen saturation
#
# Adapted from Matlab to R by Jill Arriola, 2021-03-16
#
# Function to calclulate equilibrium OXYGEN concentration in seawater
# from SST [C] and SSS [PSU].
#
# Reference:
# Garcia, H., and L.I. Gordon (1992), Oxygen solubility in seawater:
# Better fitting equations, Limnol. Oceanogr., 376, 1307-1312.
#
# INPUTS
# temp = in situ temperature [deg C]
# salt = in situ salinity [PSU]
#
# OUTPUTS
# oxysat = oxygen saturation (mmol/m^3)
#
# USES: fun_density(temp, salt)
#'
#' @param temp
#' @param salt
#'
#' @return oxysat (mmol/m^3)
#' @export
#'
fun_eqb_oxygen <- function(temp, salt){

# Coefficients - DO NOT CHANGE
A_0 = 5.80818
A_1 = 3.20684
A_2 = 4.11890
A_3 = 4.93845
A_4 = 1.01567
A_5 = 1.41575
B_0 = -7.01211e-3
B_1 = -7.25958e-3
B_2 = -7.93334e-3
B_3 = -5.54491e-3
C_0 = -1.32412e-7


ts = log((298.15 - temp)/(273.15 + temp)) # scaled temp

eqoxy = A_0 + A_1*ts + A_2*(ts^2) + A_3*(ts^3) + A_4*(ts^4) +
     A_5*(ts^5) + salt*(B_0 + B_1*ts + B_2*(ts^2) + B_3*(ts^3)) + C_0*(salt^2)

eqoxy1 = exp(eqoxy) # umol/kg

oxysat <- eqoxy1 * fun_density(temp = temp, salt = salt, P = 0) * 1e-3 # mmol/m3

return(oxysat)
}




