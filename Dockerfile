## Dockerfile for optimized elm version 0.16
FROM haskell:7.10.2
MAINTAINER Kuba Łopuszański <qbolec@gmail.com>

ENV PATH $PATH:/elm/Elm-Platform/optimized/.cabal-sandbox/bin
WORKDIR elm
RUN apt-get update
RUN apt-get -y install curl
RUN apt-get -y install git-core
RUN curl https://raw.githubusercontent.com/qbolec/elm-platform/optimized/installers/BuildNoProfiling.hs > BuildNoProfiling.hs
RUN runhaskell BuildNoProfiling.hs optimized
ENTRYPOINT ["elm-make"]
