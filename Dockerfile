# Start from the ubuntu 18.04 image as base file
FROM ubuntu:18.04

RUN apt-get update && apt-get upgrade

# Packages needed that don't come with the base image.
RUN apt-get install -y lsb-release curl gnupg2

# RUN tee /etc/apt/sources.list.d/robotpkg.list <<EOF \
# deb [arch=amd64] http://robotpkg.openrobots.org/wip/packages/debian/pub $(lsb_release -sc) robotpkg \
# deb [arch=amd64] http://robotpkg.openrobots.org/packages/debian/pub $(lsb_release -sc) robotpkg \
# EOF

RUN echo "deb [arch=amd64] http://robotpkg.openrobots.org/wip/packages/debian/pub $(lsb_release -sc) robotpkg" >> /etc/apt/sources.list.d/robotpkg.list
RUN echo "deb [arch=amd64] http://robotpkg.openrobots.org/packages/debian/pub $(lsb_release -sc) robotpkg" >> /etc/apt/sources.list.d/robotpkg.list

RUN curl http://robotpkg.openrobots.org/packages/debian/robotpkg.key | apt-key add -
RUN apt-get update
RUN apt-get install -y robotpkg-py36-crocoddyl

ENV PATH="/opt/openrobots/bin:$PATH"
ENV PKG_CONFIG_PATH="/opt/openrobots/lib/pkgconfig:$PKG_CONFIG_PATH"
ENV LD_LIBRARY_PATH="/opt/openrobots/lib:$LD_LIBRARY_PATH"
ENV PYTHONPATH="/opt/openrobots/lib/python3.6/site-packages:$PYTHONPATH"

RUN apt-get install -y ipython3 \
    && apt-get install -y robotpkg-py36-qt5-gepetto-viewer \
    && apt-get install -y robotpkg-py36-qt5-gepetto-viewer-corba \
    && apt-get install -y robotpkg-py36-hpp-fcl \
    && apt-get install -y ffmpeg

RUN apt-get update && apt-get upgrade

RUN apt-get -y install python3-pip \
    && pip3 install matplotlib

