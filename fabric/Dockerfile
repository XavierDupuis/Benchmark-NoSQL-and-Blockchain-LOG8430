FROM ubuntu:latest
RUN apt-get update
RUN apt install -y nodejs npm curl docker.io docker-compose
RUN apt-get install -y build-essential
RUN git clone https://github.com/hyperledger/caliper-benchmarks.git
WORKDIR caliper-benchmarks/
RUN git checkout d02cc8bbc17afda13a0d3af1122d43bfbfc45b0a
RUN npm init -y
RUN npm install --only=prod @hyperledger/caliper-cli@0.4
WORKDIR networks/fabric/config_solo_raft/
RUN ./generate.sh
WORKDIR /caliper-benchmarks/
#RUN docker pull hyperledger/fabric-ccenv:1.4.4
#RUN docker tag hyperledger/fabric-ccenv:1.4.4 hyperledger/fabric-ccenv:latest
RUN npm install --save fabric-client fabric-ca-client
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.25.0/install.sh | bash
SHELL ["/bin/bash", "-c", "source ~/.profile"]
RUN nvm install 12
RUN wget https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tgz
RUN tar -xvf Python-2.7.18.tgz
WORKDIR Python-2.7.18/
RUN ./configure
RUN make
RUN make install
RUN ln -sf /usr/local/bin/python2.7 /usr/bin/python
RUN python --version
## SHOULD BE python2.7
RUN npm rebuild grpc --force
#RUN chmod 777 /var/run/docker.sock
WORKDIR /caliper-benchmarks/
#CMD ["/bin/bash"]
CMD ["chmod", "777", "/var/run/docker.sock", "&&", "docker", "pull", "hyperledger/fabric-ccenv:1.4.4", "&&", "docker", "tag", "hyperledger/fabric-ccenv:1.4.4", "hyperledger/fabric-ccenv:latest", "npx","calip>

