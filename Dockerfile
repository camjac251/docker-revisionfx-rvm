FROM ubuntu:20.04

# Download/Install RevisionFX Licensing Tools
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC
RUN apt-get update
RUN apt-get install -qqy wget apt-utils tzdata libidn11

RUN wget https://revisionfx.com/wp-content/uploads/FloatingLicensing.tar.gz
RUN tar xf FloatingLicensing.tar.gz
RUN rm -f FloatingLicensing.tar.gz
RUN chmod +x RVLFloatLicenseSoftware-*-linux-x64-installer.run
RUN ./RVLFloatLicenseSoftware-*-linux-x64-installer.run --unattendedmodeui minimal --mode unattended --acceptEULA 1 --clientOrServer server

VOLUME /usr/local/revision/floatinglicenses/Licenses

# RVL server
EXPOSE 9412

# Add startup script
COPY ./start.sh /opt/start.sh
RUN chmod +x /opt/start.sh

# Run the startup script
CMD ["/opt/start.sh"]
