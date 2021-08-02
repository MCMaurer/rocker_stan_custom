FROM rocker/tidyverse:latest

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
  	apt-utils \
  	ed \
  	libnlopt-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/

# Install rstan
RUN install2.r --error --deps TRUE rstan

RUN apt-get update && apt-get install -y  --no-install-recommends\
   git-core \
   libcurl4-openssl-dev \
   libgit2-dev \
   libssh2-1-dev \
   libicu-dev \
   libpng-dev \
   libudunits2-dev \
   zlib1g-dev \
   libgdal-dev \
   libproj-dev \
   libgeos-dev \
   libssl-dev \
   libxml2-dev \
   make pandoc \
   pandoc-citeproc \
   sqlite3 \
   libsqlite3-dev \
   libnode-dev \
   && rm -rf /var/lib/apt/lists/*


RUN echo "options(repos = c(CRAN = 'https://packagemanager.rstudio.com/all/latest'), download.file.method = 'libcurl')" >> /usr/local/lib/R/etc/Rprofile.site
    
RUN install2.r -s --error \
bayesplot \
brms \
coda \
loo \
projpred \
rstanarm \
rstantools \ 
tidybayes
