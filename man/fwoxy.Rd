\name{fwoxy}
\alias{fwoxy}
\title{Forward oxygen model}
\description{Based on the Odum (1956) open water method, this forward model predicts a future oxygen time series based on initial conditions, such as the concentration of oxygen, ecosystem respiration, windspeed, light efficiency, temperature, salinity, and height of the well-mixed water column. The model outputs a 6 day time series of oxygen concentration, time rate of change of oxygen, ecosystem respiration, and PAR.}
\usage{
fwoxy(
run_name,
a_param = 0.2,
er_param = 20,
ht_const = 3,
salt_const = 25,
temp_const = 25,
wspd_const = 3)
}

\arguments{
  \item{run_name}{Input name to keep track of which run of the model was performed, must be in ''}
  \item{a_param}{Light efficiency ((mmol/m^3)/day)/(W/m^2))}
  \item{er_param}{Ecosystem respiration (mmol/m^3/day)}
  \item{ht_const}{Depth of the well-mixed water column (m)}
  \item{salt_const}{Salinity of the seawater (ppt)}
  \item{temp_const}{Water temperature (degrees C)}
  \item{wspd_const}{Wind speed at 10m height (m/s)}
}
\value{
  \item{c}{oxygen concentration (mmol/m^3^)}
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
# Model run name
run_name <- 'example'

# Set model parameters
a_param <- 0.2
er_param <- 20

# Set model forcings
ht_const <- 3
salt_const <- 25
temp_const <- 25
wspd_const <- 3

fwoxy(run_name = run_name, a_param = a_param, er_param = er_param,
ht_const = ht_const, salt_const = salt_const, temp_const = temp_const,
wspd_const = wspd_const)
}}
