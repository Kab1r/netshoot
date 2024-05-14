FROM debian:stable-slim
LABEL org.opencontainers.image.source https://github.com/kab1r/netshoot

RUN apt-get update \
 && apt-get install --yes ca-certificates curl gnupg lsb-release \
 && curl -fsSL https://azlux.fr/repo.gpg.key | gpg --dearmor -o /usr/share/keyrings/azlux-archive-keyring.gpg \
 && sh -c 'echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/azlux-archive-keyring.gpg] http://packages.azlux.fr/debian \
  $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/azlux.list >/dev/null' \
 && apt-get update \
 && apt-get install --yes \
      docker-ctop \
      curl \
      fish \
      bind9-dnsutils \
      fping \
      iftop \
      iperf \
      iperf3 \
      iperf3 \
      iproute2 \
      iptables \
      httpie \
      jq \
      yq \
      nftables \
      nmap \
      strace \
      tcptraceroute \
      vim \
      swaks \
 && apt-get clean autoclean \
 && apt-get autoremove --yes \
 && rm -rf /var/lib/{apt,dpkg,cache,log}

CMD ["fish"]
