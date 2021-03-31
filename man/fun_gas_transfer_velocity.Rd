\name{fun_gas_transfer_velocity}
\alias{fun_gas_transfer_velocity}
\title{Gas transfer velocity}
\description{A calculation of the gas transfer velocity across the air-sea interface based on inputs of a Schmidt number and windspeed. Inputs are taken directly from the fwoxy.R code and are not explicitly given.}
\usage{
fun_gas_transfer_velocity(sc, wspd2)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sc}{Schmidt number (unitless). Provided in the fwoxy.R code.}
  \item{wspd2}{Windspeed squared (m^2/s^2). Provided in the fwoxy.R code.}
}
\value{kw (m/s) as the gas transfer velocity}
\references{WANNINKHOF, R., LIMNOLOGY AND OCEANOGRAPHY METHODS, 12(6), 351-362, 2014.}
\author{Orginally written in Matlab by Maria Herrmann, converted to R code by Jill Arriola.}

