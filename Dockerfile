# Set the base image to Ubuntu
FROM continuumio/miniconda3

# File Author / Maintainer
MAINTAINER Thomas Schmelzer "thomas.schmelzer@gmail.com"

RUN conda install -q -y pandas=0.18.1 jupyter

ADD . /geneva_talk
WORKDIR /geneva_talk

# build the environment
RUN conda install -y -q -c mosek mosek

# new license for Mosek 8
ENV MOSEKLM_LICENSE_FILE aaa

