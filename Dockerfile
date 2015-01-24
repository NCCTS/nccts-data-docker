# Docker version 1.4.1, build 5bc2ff8
FROM nccts/baseimage:0.0.11

# nccts/nccts-data
# Version: 0.0.11
MAINTAINER "Michael Bradley" <michael.bradley@nccts.org>
# Deus, refugium nostrum et virtus, populum ad te clamantem propitius respice!

# Cache buster
ENV REFRESHED_AT [2015-01-23 Fri 14:39]

# Set environment variables
ENV HOME /root

# Add supporting files for the build
ADD . /docker-build

# Run main setup script, cleanup supporting files
RUN chmod -R 777 /docker-build
RUN /docker-build/setup.sh && rm -rf /docker-build

# Use phusion/baseimage's init system as the entrypoint:
# 'entry.sh' starts shell (or tmux) as the 'sailor' user
# (tmux: with a session named 'data')
ENTRYPOINT ["/sbin/my_init", "--", "/usr/local/bin/entry.sh", "data"]
CMD [""]

# example usage
# --------------------------------------------------
# docker run -it --name nccts-data -v /home/sailor/site nccts/nccts-data /bin/true
