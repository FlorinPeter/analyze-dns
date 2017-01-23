FROM centos:centos7

MAINTAINER Florin Peter

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh && \
    INSTALL_PKGS="iptables lsof make gcc git iputils telnet traceroute bind-utils" && \
    yum install --setopt=tsflags=nodocs -y $INSTALL_PKGS --enablerepo=rhel-7-server-rpms,rhel-7-server-optional-rpms && \
    rpm -V $INSTALL_PKGS && \
    cd / && \
    git clone https://github.com/jedisct1/dnsblast.git dnsblast-build && \
    cd /dnsblast-build && \
    make && \
    mv ./dnsblast / && cd / && \
    yum -y erase make && \
    yum clean all

ENTRYPOINT ["/entrypoint.sh"]

CMD ["analyze"]