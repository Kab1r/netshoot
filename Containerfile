FROM debian:testing-slim

RUN apt-get update \
 && apt-get install --yes ca-certificates curl gnupg lsb-release \
 && curl -fsSL https://azlux.fr/repo.gpg.key | gpg --dearmor -o /usr/share/keyrings/azlux-archive-keyring.gpg \
 && sh -c 'echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/azlux-archive-keyring.gpg] http://packages.azlux.fr/debian \
  trixie main" | tee /etc/apt/sources.list.d/azlux.list >/dev/null' \
 && apt-get update \
 && apt-get install --yes \
      awscli \
      bat \
      bind9-dnsutils \
      curl \
      fish \
      fping \
      httpie \
      iftop \
      iperf \
      iperf3 \
      iproute2 \
      iptables \
      iputils-ping \
      jq \
      less \
      nftables \
      nmap \
      ssh \
      strace \
      swaks \
      tcptraceroute \
      traceroute \
      unzip \
      vim \
      yq \
      postgresql-client \
      ripgrep \
      fzf \
      fd-find \
      du-dust \
 && curl https://sh.rustup.rs -sSf | sh -s -- -y \
 && sh -c ". ~/.cargo/env && cargo install eza" \
 && curl -fsSL https://starship.rs/install.sh | sh -s -- -y \
 && fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher Kab1r/Fisher-Bang-Bang' \
 && apt-get clean autoclean \
 && apt-get autoremove --yes \
 && rm -rf /var/lib/{apt,dpkg,cache,log}

COPY fish/conf.d/* /root/.config/fish/conf.d/
COPY fish/functions/* /root/.config/fish/functions
COPY fish/starship.toml /root/.config/fish/

CMD ["fish"]
