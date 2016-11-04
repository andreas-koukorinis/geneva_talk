# Set the base image to Ubuntu
FROM continuumio/miniconda3

# File Author / Maintainer
MAINTAINER Thomas Schmelzer "thomas.schmelzer@gmail.com"

RUN conda install -q -y pandas=0.18.1 ipython-notebook=4.0.4 matplotlib statsmodels=0.6.1

ADD ./RISE-3.x /talk/RISE-3.x
ADD ./books /talk/books
ADD config.py /talk/config.py

WORKDIR /talk

# installing mosek
RUN conda install -y -q -c mosek mosek
ADD ./license /talk/license
ENV MOSEKLM_LICENSE_FILE /talk/license/mosek.lic

# installing cvxpy
RUN conda install -y -q -c cvxgrp cvxpy


# create the default profile for ipython
RUN ipython profile create

# install RISE-3.x
RUN python /talk/RISE-3.x/setup.py install

RUN rm -rf RISE-3.x
