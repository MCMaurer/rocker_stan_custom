#!/bin/bash

open http://localhost:8787

docker run -e PASSWORD="$1" -p 8787:8787 -v "$(pwd)"/mount_this:/home/rstudio/mount_this rocker/tidyverse
