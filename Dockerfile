FROM rocker/tidyverse

RUN apt-get update -qq && apt-get install -y \
	libssl-dev \
	libcurl4-gnutls-dev \
	libxml2-dev

RUN R -e "install.packages(c('fitdistrplus', 'plumber'))"

COPY callAPI.R fit-prob.R ./

EXPOSE 1026

ENTRYPOINT ["R", "-e", "source('callAPI.R')"]
