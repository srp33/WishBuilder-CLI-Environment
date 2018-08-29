FROM ubuntu:16.04

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

RUN echo "deb http://cran.rstudio.com/bin/linux/ubuntu xenial/" | tee -a /etc/apt/sources.list \
 && gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9 \
 && gpg -a --export E084DAB9 | apt-key add - \
 && apt-get update --fix-missing && apt-get install -y --allow-unauthenticated wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 git mercurial subversion \
    build-essential libatlas-dev libatlas3-base libatlas-base-dev \
    r-base r-base-dev libcurl4-openssl-dev libssl-dev parallel libxml2-dev \
    zip unzip tzdata \
 && update-alternatives --set libblas.so.3 /usr/lib/atlas-base/atlas/libblas.so.3 \
 && update-alternatives --set liblapack.so.3 /usr/lib/atlas-base/atlas/liblapack.so.3 \
 && echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh \
 && wget --quiet https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh -O ~/anaconda.sh \
 && /bin/bash ~/anaconda.sh -b -p /opt/conda \
 && rm ~/anaconda.sh \
 && conda install -y numpy hdf5 xlrd markdown requests h5py yaml pip pandas \
 && conda install -y -c conda-forge fastnumbers pyarrow capturer \
 && R -e "install.packages(c('tidyverse', 'XML'), repos='https://rweb.crmda.ku.edu/cran/', clean=TRUE)" \
 && R -e "source('https://bioconductor.org/biocLite.R'); biocLite('org.Hs.eg.db'); biocLite('annotate')" \
 && cd /tmp; git clone https://github.com/srp33/ShapeShifter.git; mv ShapeShifter/ShapeShifter /

ADD run_test /
