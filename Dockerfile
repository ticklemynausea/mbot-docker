FROM ubuntu

# Copy stuff
COPY mbot-config /tmp/mbot-config
COPY provision.sh /tmp

# Provision the machine
RUN /tmp/provision.sh

USER mbot
ENV HOME /home/mbot

WORKDIR /home/mbot/mbot
CMD [ "./mbot", "-d" ]