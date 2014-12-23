# Docker version 1.4.1, build 5bc2ff8
FROM nccts/baseimage:0.0.10

# nccts/nccts-data
# Version: 0.0.10
MAINTAINER "Michael Bradley" <michael.bradley@nccts.org>
# Deus, refugium nostrum et virtus, populum ad te clamantem propitius respice!

# Cache buster
ENV REFRESHED_AT [2014-12-23 Tue 05:22]

# Set environment variables
ENV HOME /root

# Add supporting files for the build
ADD . /docker-build

# Run main setup script, cleanup supporting files
RUN chmod -R 777 /docker-build
RUN /docker-build/setup.sh && rm -rf /docker-build

# Use phusion/baseimage's init system as the entrypoint:
# 'entry.sh' starts tmux as the 'sailor' user with a session named 'nccts-data'
ENTRYPOINT ["/sbin/my_init", "--", "/usr/local/bin/entry.sh", "data"]
CMD [""]

# example usage
# --------------------------------------------------
# docker run -it --name nccts-data -v /home/sailor/site nccts/nccts-data /bin/true
