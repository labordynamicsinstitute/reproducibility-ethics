FROM rocker/verse:4.4.1

# Restore the R packages recorded in renv.lock into the site library
WORKDIR /tmp/build
COPY renv.lock libraries.R ./
RUN Rscript libraries.R && rm -rf /tmp/build

WORKDIR /home/rstudio
