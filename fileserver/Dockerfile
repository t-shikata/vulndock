FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# パッケージ更新 & sshd install
RUN apt update && apt install -y \
    openssh-server \
    sudo \
    coreutils && \
    rm -rf /var/lib/apt/lists/*

# sshd 実行に必要なディレクトリ & ホスト鍵生成
RUN mkdir /var/run/sshd && \
    ssh-keygen -A

# 脆弱ユーザー作成
RUN useradd -m user && echo "user:iloveyou" | chpasswd

RUN useradd -m -s /bin/bash sato.t \
 && echo "sato.t:Welcome123" | chpasswd

# sudo 権限付与（パスワードあり sudo）
RUN usermod -aG sudo sato.t

# cp の SUID 設定
RUN chmod u+s /bin/cp

# secret ファイル作成
RUN echo "FLAG{root_only_secret}" > /root/secret && \
    chown root:root /root/secret && \
    chmod 600 /root/secret

# SSHの脆弱設定
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config

# root の .ssh ディレクトリ作成
RUN mkdir -p /root/.ssh \
 && chmod 700 /root/.ssh

# 公開鍵を配置
COPY ./pseudo-key.pub /root/.ssh/authorized_keys

# 権限設定（重要）
RUN chmod 600 /root/.ssh/authorized_keys \
 && chown -R root:root /root/.ssh

# SSH ポート
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
