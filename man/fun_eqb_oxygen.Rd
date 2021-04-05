\name{fun_eqb_oxygen}
\alias{fun_eqb_oxygen}
\title{Oxygen saturation}
\description{Calculates the oxygen equilibrium in seawater and determines if the water column is under or super saturated. Uses seawater density from fun_density.R function.}
\usage{fun_eqb_oxygen(temp, salt)}
\arguments{
  \item{temp}{Water temperature in degrees Celsius}
  \item{salt}{Salinity of seawater in parts per thousand}}
\value{Returned value is oxysat = Oxygen saturation in mmol/m^3}
\references{Garcia, H., and L.I. Gordon (1992), Oxygen solubility in seawater: Better fitting equations, Limnol. Oceanogr., 376, 1307-1312.}
\author{Original code written in Matlab by Raymond Najjar, adapted by Maria Herrmann, converted to R code by Jill Arriola.}
\seealso{
\code{\link{fun_density}} for seawater density calculation.}

