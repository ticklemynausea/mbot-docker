FROM ubuntu

# Copy stuff
COPY provision/* /tmp/

# Provision the machine
RUN /tmp/pre-setup.sh
RUN /tmp/install_popen-noshell.sh
RUN /tmp/install_easycurl.sh
RUN /tmp/install_mbot.sh
RUN /tmp/install_mbot-shell.sh
RUN /tmp/post-setup.sh

USER mbot
ENV HOME /home/mbot
ENV PYTHONIOENCODING utf-8

WORKDIR /vol
ENTRYPOINT [ "/usr/local/bin/mbot", "-d" ]
