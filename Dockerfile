FROM ubuntu:latest

# Download/Install Foundry Licensing Tools
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC
RUN apt-get update
RUN apt-get install -qqy wget apt-utils tzdata libidn11

RUN wget https://thefoundry.s3.amazonaws.com/products/licensing/releases/8.1.3/FoundryLicensingUtility_8.1.3.deb
RUN apt-get install --no-install-recommends ./FoundryLicensingUtility_8.1.3.deb -y
RUN rm FoundryLicensingUtility_8.1.3.deb

VOLUME /opt/rlm/licenses

# rlm server
EXPOSE 4101
# RLM Web Server (admin gui)
EXPOSE 4102
# isv server
EXPOSE 5053

# Add startup script
COPY ./start.sh /opt/start.sh
RUN chmod +x /opt/start.sh

# Run the startup script
CMD ["/opt/start.sh"]
