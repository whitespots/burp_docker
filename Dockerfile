#FROM openjdk:8u151-jre-alpine3.7
FROM adoptopenjdk/openjdk11:jre-11.0.9.1_1-alpine
LABEL maintainer="whitespots.io"

ENV HOME /home/burp

ENV BURP_SUITE_PRO_VERSION="2020.11"
ENV BURP_SUITE_PRO_CHECKSUM="8ea15e1a0a5b742744afb7e1ab25759081e468eee6a853d7a8546ec3b5c6096c"

ENV JAVA_OPTS "-Dawt.useSystemAAFontSettings=gasp "\
  "-Dswing.aatext=true "\
  "-Djava.awt.headless=true "\
  "-Dsun.java2d.xrender=true" \
  "-XX:+UnlockExperimentalVMOptions "\
  "-XX:+UseCGroupMemoryLimitForHeap "\
  "-XshowSettings:vm "

RUN apk add --no-cache \
  libxrender \
  libxi \
  libxtst \
  curl \
  openssl \
  ca-certificates \
  ttf-freefont \
  ttf-dejavu

COPY . /home/burp/
COPY config/ /home/burp/config/
RUN chmod +x /home/burp/download.sh /home/burp/entrypoint.sh && \
  /home/burp/download.sh && \
  mv "$HOME/burpsuite_pro_v$BURP_SUITE_PRO_VERSION.jar" /home/burp/burpsuite_pro.jar

RUN addgroup -S burp && \
  adduser -S -g burp burp

RUN mkdir -p .java/.userPrefs

USER burp
WORKDIR $HOME

# Burp Proxy
EXPOSE 8080

# Burp REST API
EXPOSE 1337

ENTRYPOINT ["/home/burp/entrypoint.sh", "/home/burp/burpsuite_pro.jar"]