# Set the base image to Ubuntu
FROM continuumio/miniconda3

# File Author / Maintainer
MAINTAINER Thomas Schmelzer "thomas.schmelzer@gmail.com"

RUN conda install -q -y pandas=0.18.1 ipython-notebook=4.0.4 matplotlib

ADD . /talk
WORKDIR /talk

# build the environment
RUN conda install -y -q -c mosek mosek

# new license for Mosek 8
ENV MOSEKLM_LICENSE_FILE /talk/license/mosek.lic

# create the default profile for ipython
RUN ipython profile create

# install RISE-3.x
RUN python /talk/RISE-3.x/setup.py install

RUN rm -rf RISE-3.x && rm docker-compose.yml && rm Dockerfile
