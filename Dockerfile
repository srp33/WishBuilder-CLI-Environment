FROM bioconductor/bioconductor_docker:3.19

RUN R -e "BiocManager::install(c('tidyverse', 'XML'))"

#hdf5 xlrd markdown requests h5py pyarrow capturer
RUN pip3 install markdown requests capturer

ADD run_test.sh /
