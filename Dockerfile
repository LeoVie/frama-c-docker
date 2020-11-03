FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive 
RUN apt update
RUN apt upgrade -y
RUN apt install -y make m4 gcc opam
RUN opam init --disable-sandboxing -c 4.05.0 --shell-setup
RUN eval $(opam env) && opam install -y depext
RUN eval $(opam env) && opam depext --install -y lablgtk3 lablgtk3-sourceview3
RUN eval $(opam env) && opam depext --install -y frama-c
RUN eval $(opam env) && why3 config --detect
RUN eval $(opam env) && why3 config --full-config
COPY entrypoint.sh /src/entrypoint.sh

WORKDIR /src
ENTRYPOINT ["/src/entrypoint.sh"]