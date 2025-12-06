FROM mydesk-base
COPY session.sh /session.sh
COPY skk-bin/ /opt-ro/skk
COPY Xdefaults /home/.Xdefaults
RUN mkdir -p /opt
RUN ln -s /opt-ro/skk /opt/skk

# Temp. Merge to base image later.
RUN apk add swaybg kiconthemes
