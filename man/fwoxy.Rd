\name{fwoxy}
\alias{fwoxy}
\title{Forward oxygen model}
\description{Based on the Odum (1956) open water method, this forward model predicts a future oxygen time series based on initial conditions, such as the concentration of oxygen, ecosystem respiration, windspeed, light efficiency, temperature, salinity, and height of the well-mixed water column. The model outputs a 6 day time series of oxygen concentration, time rate of change of oxygen, ecosystem respiration, and PAR.}
\usage{
fwoxy(
oxy_ic = oxy_ic,
a_param = a_param,
er_param = er_param,
ht_in= ht_const,
salt_in = salt_const,
temp_in = temp_const,
wspd_in = wspd_const
)
}

\arguments{
  \item{oxy_ic}{Initial concentration of oxygen (mmol/m^3)}
  \item{a_param}{Light efficiency ((mmol/m^3)/day)/(W/m^2))}
  \item{er_param}{Ecosystem respiration (mmol/m^3/day)}
  \item{ht_in}{Depth of the well-mixed water column (m)}
  \item{salt_in}{Salinity of the seawater (ppt)}
  \item{temp_in}{Water temperature (degrees C)}
  \item{wspd_in}{Wind speed at 10m height (m/s)}

}
\value{
  \item{c}{oxygen concentration (mmol/m^3)}
  \item{t}{time step (seconds)}
  \item{dcdtd}{time rate of change (mmol/m^3/day)}
  \item{gppd}{gross primary production (mmol/m^3/day)}
  \item{erd}{ecosystem respiration (mmol/m^3/day)}
  \item{gasexd}{gas exchange (mmol/m^3/day)}
}
\references{Odum, H.T. (1956) Primary production in flowing waters 1. Limnology and Oceanography, 1(2), 102-117.}
\author{Originally written in Matlab by Maria Herrmann, converted to R code by Jill Arriola}
\note{Positive gas flux is from water to air.}

\seealso{
\code{\link{fun_density}}
\code{\link{fun_eqb_oxygen}}
\code{\link{fun_gas_transfer_velocity}}
\code{\link{fun_par_sin_model}}
\code{\link{fun_schmidt_oxygen}}
}

\examples{
\dontrun{
# Set initial oxygen concentration
oxy_ic <- 250

# Set model parameters
a_param <- 0.2
er_param <- 20

# Set model forcings
ht_const <- 3
salt_const <- 25
temp_const <- 25
wspd_const <- 3

fwoxy(a_param = a_param, er_param = er_param,
ht_in = ht_const, salt_in = salt_const, temp_in = temp_const,
wspd_in = wspd_const)
}}
