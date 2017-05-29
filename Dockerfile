FROM lsiobase/alpine.python.armhf:3.6
MAINTAINER sparklyballs

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# install pip packages
RUN \
 pip install --no-cache-dir -U \
	comictagger \
	configparser \
	tzlocal && \

# cleanup
 rm -rf \
	/root/.cache \
	/tmp/*

# add local files
COPY root/ /

# ports and volumes
VOLUME /config /comics /downloads
EXPOSE 8090
