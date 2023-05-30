FROM registry.access.redhat.com/ubi9/ubi:latest

# Copying all contents of rpmbuild repo inside container
COPY . .

RUN dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
RUN dnf install -y https://mirror.stream.centos.org/9-stream/AppStream/x86_64/os/Packages/rpmdevtools-9.5-1.el9.noarch.rpm

# Installing tools needed for rpmbuild , 
# depends on BuildRequires field in specfile, (TODO: take as input & install)
RUN dnf install -y rpm-build rpmdevtools gcc make python39 git rust cargo openssl-devel systemd-rpm-macros yum-utils

# Setting up node to run our JS file
# Download Node Linux binary
RUN curl -O https://nodejs.org/dist/v20.2.0/node-v20.2.0-linux-x64.tar.xz

# Extract and install
RUN tar --strip-components 1 -xvf node-v* -C /usr/local

# Install dependecies and build main.js
RUN npm install --production \
&& npm run-script build

# All remaining logic goes inside main.js , 
# where we have access to both tools of this container and 
# contents of git repo at /github/workspace
ENTRYPOINT ["node", "/lib/main.js"]
