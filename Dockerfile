FROM rocker/r-ver:3.6.3

RUN apt-get update -qq && apt-get install -y \
	libssl-dev \
	libcurl4-gnutls-dev \
	libxml2-dev

RUN R -e "install.packages(c('plumber', 'dplyr', 'httr', 'jsonlite', 'fitdistrplus'))"

COPY callAPI.R fit-prob.R ./

EXPOSE 3030

ENTRYPOINT ["R", "-e", "source('callAPI.R')"]
