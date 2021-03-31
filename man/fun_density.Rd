\name{fun_density}
\alias{fun_density}
\title{Seawater density}
\description{Computes density of seawater as a function of water temperature, salinity, and atmospheric pressure}
\usage{fun_density(temp, salt, P)}
\arguments{
  \item{temp}{water temperature in degrees Celsius}
  \item{salt}{Salinity of water in parts per thousand}
  \item{P}{Pressure above atmospheric in decibars}}
\details{UNESCO accepted equations to determine density of seawater}
\value{Returns RHO = Density (kg/m^3)}
\references{MILLERO AND POISSON, DEEP-SEA RESEARCH, 28A, 625-629, 1981.}
\author{Originally written in Matlab by Maria Herrmann, converted to R code by Jill Arriola}
\note{THE STANDARD ERROR OF THIS EQUATION IS 3.6 X 10-3 kg/m^3}
\keyword{ density }

