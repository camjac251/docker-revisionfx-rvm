FROM ubuntu:latest

# Download/Install Foundry Licensing Tools
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC
RUN apt-get update
RUN apt-get install -qqy wget apt-utils tzdata libidn11

RUN wget https://thefoundry.s3.amazonaws.com/tools/FLT/7.3v2/FLT7.3v2-linux-x86-release-64.tgz
RUN tar xzf FLT7.3v2-linux-x86-release-64.tgz
RUN rm -f FLT7.3v2-linux-x86-release-64.tgz
RUN cd /FLT_7.3v2_linux-x86-release-64RH/ && echo yes | /bin/sh install.sh

# Update Reprise to latest version
RUN wget https://www.reprisesoftware.com/license_admin_kits/x64_l1.admin.tar.gz
RUN tar xvf x64_l1.admin.tar.gz
RUN rm -f x64_l1.admin.tar.gz
RUN cp -f /x64_l1.admin/rlm /usr/local/foundry/LicensingTools7.3/bin/RLM/rlm.foundry
RUN rm -rf /x64_l1.admin/

VOLUME /opt/rlm/licenses

# rlm server
EXPOSE 5053
# admin gui
EXPOSE 5054
# isv server
EXPOSE 4101

# Add startup script
COPY ./start.sh /opt/start.sh
RUN chmod +x /opt/start.sh

# Run the startup script
CMD ["/opt/start.sh"]
