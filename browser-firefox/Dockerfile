FROM debian:13
RUN mkdir -p /etc/apt/keyrings
RUN apt update && apt upgrade -y && apt install -y ca-certificates locales
RUN sed -i -E 's/# (ja_JP.UTF-8)/\1/' /etc/locale.gen
RUN locale-gen
RUN update-locale LANG=ja_JP.UTF-8
COPY repo-signing-key.gpg /etc/apt/keyrings/packages.mozilla.org.asc
COPY mozilla.sources /etc/apt/sources.list.d/
COPY prefer-mozilla /etc/apt/preferences.d/mozilla
RUN apt-get update && apt-get install -y firefox
