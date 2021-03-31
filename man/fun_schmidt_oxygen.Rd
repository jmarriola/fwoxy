\name{fun_schmidt_oxygen}
\alias{fun_schmidt_oxygen}
\title{Schmidt number}
\description{Calculates the Schmidt number which is used to estimate the air-sea gas transfer velocity for oxygen.}
\usage{
fun_schmidt_oxygen(temp, salt)}
\arguments{
  \item{temp}{Water temperature in degress Celsius}
  \item{salt}{Seawater salinity in parts per thousand}
\details{The Schmidt number is a dimensionless number defined as the ratio of kinematic viscosity to the molecular diffusion coefficient. It is required to calculate the air-sea gas transfer velocity.}
\value{sc (unitless) = Schmidt number}
\author{Originally written in Matlab by Maria Herrmann, converted to R code by Jill Arriola}
\seealso{
\code{\link{fun_gas_transfer_velocity}}
}
\keyword{ Schmidt }

