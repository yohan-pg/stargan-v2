FROM nvidia/cuda:10.1-base
RUN apt-get update 
RUN apt-get install unzip
RUN yes | apt-get install wget
RUN yes | apt-get install python3-pip
COPY ./install.sh /stargan-v2/install.sh
RUN cd /stargan-v2 && ./install.sh