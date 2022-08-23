FROM ubuntu:18.04 as ubuntu
WORKDIR /usr/src/app
COPY . .

# Install Deb Packages
RUN apt-get -y update
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install -y curl r-base r-base-dev libexpat1-dev python3.7 python3.7-dev \
    libpython3.7-dev python-apt python3-apt perl mysql-client \
    libmysqlclient-dev make libssl-dev libgmp-dev libopenblas-base \
    libopenblas-dev liblapack-dev libatlas-base-dev pkg-config ssh clang llvm

# Symlink Default Perl
RUN mkdir -p /usr/local/bin
RUN test -e /usr/local/bin/perl || ln -s /usr/bin/perl /usr/local/bin/perl

# Build Dependencies
# this command can be repeated later after pulling updates to the repo
R=/usr/bin/R PYTHON=python3.7 make deploy-dev
