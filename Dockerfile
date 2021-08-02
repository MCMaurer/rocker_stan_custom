FROM rocker/tidyverse:latest

# customizing RStudio
COPY .config /home/rstudio/.config
COPY .Rprofile /home/rstudio/
RUN chown -R rstudio:rstudio /home/rstudio/

# installing c++ stuff for Stan
RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
	clang

## From https://github.com/stan-dev/rstan/wiki/Installing-RStan-on-Linux
RUN echo \
	'dotR <- file.path(Sys.getenv("HOME"), ".R")\n\
	if (!file.exists(dotR)) dir.create(dotR)\n\
	M <- file.path(dotR, "Makevars")\n\
	if (!file.exists(M)) file.create(M)\n\
	cat("\nCXX14FLAGS=-O3 -march=native -mtune=native -fPIC",\n\
	"CXX14=g++",\n\
	file = M, sep = "\n", append = TRUE)'\
	| cat >> install_rstan.R

RUN ["r", "install_rstan.R"]


# installing rstan

RUN install2.r --error --deps TRUE \
    rstan \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# make sure rstudio can access packages
RUN chown -R rstudio:rstudio /usr/local/lib/R/
