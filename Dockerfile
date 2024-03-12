FROM jupyter/base-notebook:ubuntu-22.04

USER root

# install system libs and utils
RUN apt-get update && \
apt install -y apt-transport-https software-properties-common && \
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 && \
add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/' && \
apt-get update && apt-get install -yq --no-install-recommends \
libgdal20 \
libgdal-dev \
r-base-dev \
nano \
tree \
libssl-dev \
libcurl4-openssl-dev \
libxml2-dev \
libgsl-dev \
libpoppler-cpp-dev


# install R kernel for Jupyter notebook
RUN \
Rscript -e "install.packages('devtools')"; \
Rscript -e "devtools::install_github('IRkernel/IRkernel')"; \
Rscript -e "IRkernel::installspec()";

# install R packages
RUN \
Rscript -e "install.packages('tidyverse')"; \
Rscript -e "install.packages('tm')"; \
Rscript -e "install.packages('tidytext')"; \
Rscript -e "install.packages('topicmodels')"; \
Rscript -e "install.packages('reshape2')"; \
Rscript -e "install.packages('wordcloud')"; \
Rscript -e "install.packages('pdftools')"; \
Rscript -e "install.packages('rjson')";

