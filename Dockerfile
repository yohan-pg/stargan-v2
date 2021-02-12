FROM nvidia/cuda:10.1-base
RUN apt-get update 
RUN yes | apt-get install unzip
RUN yes | apt-get install wget
RUN yes | apt-get install python3-pip
RUN yes | apt-get install nano
RUN yes | apt-get install libgl1-mesa-glx
WORKDIR /stargan-v2
COPY ./install.sh ./install.sh
RUN ./install.sh
RUN echo "source $HOME/stargan-v2-env/bin/activate" > "$HOME/.bashrc"