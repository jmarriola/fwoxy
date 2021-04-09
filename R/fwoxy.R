# Main program for the forward oxygen model (fwoxy)

# OXYGEN BUDGET: TROC = GPP - ER - GASEX
# Positive gas flux is from water to air

# USES FUNCTIONS:
# fun_par_sin_model
# fun_eqb_oxygen
# fun_density
# fun_schmidt_oxygen
# fun_gas_transfer_velocity

# INPUT: run name, time variables, initial conditions, forcing, parameters

# OUTPUT: oxygen concentration, TROC, GPP, ER, GASEX
#'
#'
#' @param a_param
#' @param er_param
#' @param ht_in
#' @param salt_in
#' @param temp_in
#' @param wspd_in
#'
#' @import ggplot2
#' @import tidyr
#'
#' @return 2 plots and a data frame
#' @export
#'
fwoxy <- function(a_param = a_param, er_param = er_param, ht_in = ht_const,
                  salt_in = salt_const, temp_in = temp_const, wspd_in = wspd_const)
{

# Setting Parameters ------------------------------------------------------
# library(ggplot2)
# library(tidyr)

# Model inputs
# Time variables, DO NOT CHANGE
ndays <- 6              # number of days to run
dt_min <- 15            # time step in minutes

# Initial conditions: starting oxygen concentration
oxy_ic <- 250           # mmol/m3 (1 mmol/m3 = 1 uM)

# Conversion factors, DO NOT CHANGE
spm <- 60               # seconds per minute
sph <- 60 * 60          # seconds per hour
spd <- 60 * 60 * 24     # seconds per day

# Model Code --------------------------------------------------------------

# Set up time

dt <- dt_min * spm      # convert from min to seconds
tend <- ndays * spd     # time of the end of the model run
t <- seq(from = 1, to = tend, by = dt)      # create time vector
nt <- length(t)         # number of time steps

# Set up forcing vectors to match the number of time steps

# Currently set to run with variable constants, need to add if else statements
# to use with vectors

ht <- matrix(1, ncol = nt, nrow = 1) * ht_in
wspd <- matrix(1, ncol = nt, nrow = 1) * wspd_in
temp <- matrix(1, ncol = nt, nrow = 1) * temp_in
salt <- matrix(1, ncol = nt, nrow = 1) * salt_in

# Allocate output vectors to match the number of time steps

oxysat <- rep(NA,nt)    # mmol/m3, equilibrium oxygen concentration
oxysu <- rep(NA,nt)     # mmol/m3, oxygen supersaturation concentration (oxy-oxysat)
wspd2 <- rep(NA,nt)     # m2/s2 wind speed squared
sc <- rep(NA,nt)        # unitless, Schmidt number
kw <- rep(NA,nt)        # m/s, gas transfer velocity
ge <- rep(NA,nt)        # mmol/m2/s, gase exchange flux per unit area
gasex <- rep(NA,nt)     # mmol/m3/s, gase exchange flux per unit volume
par <- rep(NA,nt)       # W/m2, PAR
gpp <- rep(NA,nt)       # mmol/m3/s, gross primary production
er <- rep(NA,nt)        # mmol/m3/s, ecosystem respiration
dcdt <- rep(NA,nt)      # mmol/m3/s, time rate of change (TROC) of oxygen concentration
c <- rep(NA,nt)         # mmol/m3, oxygen concentration

# Initialize model

cin <- oxy_ic

# Forward integration (loop over time steps)

for (i in 1:(nt))
{

  # Calculate gas exchange

  oxysat[i] <- fun_eqb_oxygen(temp[i], salt[i])
  oxysu[i] <- cin - oxysat[i]
  wspd2[i] <- wspd[i] * wspd[i]
  sc[i] <- fun_schmidt_oxygen(temp[i], salt[i])
  kw[i] <- fun_gas_transfer_velocity(sc[i], wspd2[i])
  ge[i] <- kw[i] * oxysu[i]           # mmol/m2/s
  gasex[i] <- ge[i] / ht[i]           # mmol/m3/s


  # Calculuate gpp

  par[i] <- fun_par_sin_model(t[i])
  gpp[i] <- a_param/spd * par[i]


  # Calculate er

  er[i] <- er_param/spd


  # Calculate TROC

  dcdt[i] <- gpp[i] - er[i] - gasex[i]


  # Calculate oxy concentration

  c[i] <- cin + dcdt[i] * dt


  # Reset for next time step

  cin <- c[i]

}


# Conversions -------------------------------------------------

# Convert fluxes from mmol/m3/s to mmol/m3/day

dcdtd <- dcdt * spd
gppd <- gpp * spd
erd <- er * spd
gasexd <- gasex * spd


# Outputs and polts -------------------------------------------------------

## Save data

varb <- c('time step', 'oxy, mmol/m3', 'troc, mmol/m3/d', 'gasex, mmol/m3/d', 'gpp, mmol/m3/d',
          'er, mmol/m3/d','oxysu, mmol/m3', 'wspd2, m2/s2', 'sc', 'kw, m/s')
results <- data.frame(t, c, dcdtd, gasexd, gppd, erd, oxysu, wspd2, sc, kw)
colnames(results) <- varb
# write.csv(results, paste0(run_name, '.csv'))

## Plots

# Plot of oxygen concentration and flux time series in same window
labels <- c('1'='0','43201'='12','86401'='0','129601'='12','172801'='0',
            '216001'='12','259201'='0','302401'='12','345601'='0','388801'='12',
            '432001'='0','475201'='12')
breaks <- seq(1,518400,by=43200)
colors <- c(gasexd = "red3", gppd = "orange", erd = "purple4", dcdtd = "steelblue3")
fluxes <- data.frame(t, gasexd, gppd, erd, dcdtd)
resultsNew <- fluxes %>% pivot_longer(cols = gasexd:dcdtd, names_to = 'Variables', values_to = "Value")


oxyPlot <- ggplot(results, aes(x = t, y = c)) +
  geom_line(colour = "blue") +
  labs(x = "Hour of day", y = "oxy, mmol/m3") +
  theme_bw() +
  scale_x_continuous(breaks = breaks, labels = labels)

#print(oxyPlot)

fluxPlot <- ggplot(resultsNew, aes(x = t, y = Value, group = Variables, color = Variables)) +
  theme_bw() +
  geom_line() +
  labs(x = "Hour of day", y = "Flux, mmol/m3/day") +
  scale_color_manual(values = colors) +
  scale_x_continuous(breaks = breaks, labels = labels)

grid.arrange(oxyPlot, fluxPlot, ncol = 1)
#print(fluxPlot)


# Return results data frame to the global environment
return(results)
}


