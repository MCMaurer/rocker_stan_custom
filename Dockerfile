FROM rocker/tidyverse:latest

# customizing RStudio
COPY .config /home/rstudio/.config
COPY .Rprofile /home/rstudio/
COPY .R /home/rstudio/.R
RUN chown -R rstudio:rstudio /home/rstudio/

#RUN apt clean
# installing c++ stuff for Stan
RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
	clang \
    libv8-dev \
    libudunits2-dev \
    libgdal-dev \
    libgeos-dev \
    libproj-dev \
    libxml2 \
    libxml2-dev \
    libglpk-dev


# slightl different way
#RUN chmod -R 777 /usr/local/lib/R/site-library

# installing rstan

RUN install2.r --error --deps TRUE \
    rstan \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

RUN R -e "BiocManager::install('graph')"

RUN install2.r --error --deps TRUE \
    igraph \
    posterior \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

RUN install2.r --error --deps TRUE -r "https://mc-stan.org/r-packages/" \
    cmdstanr \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

RUN install2.r --error --deps TRUE \
    brms \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rdsy
