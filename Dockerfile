FROM rocker/tidyverse:latest

COPY .config /home/rstudio/.config

COPY .Rprofile /home/rstudio/

RUN chown -R rstudio:rstudio /home/rstudio/