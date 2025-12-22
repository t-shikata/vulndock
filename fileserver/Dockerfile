FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# パッケージ更新 & sshd install
RUN apt update && apt install -y \
    openssh-server \
    coreutils && \
    rm -rf /var/lib/apt/lists/*

# sshd 実行に必要なディレクトリ & ホスト鍵生成
RUN mkdir /var/run/sshd && \
    ssh-keygen -A

# 脆弱ユーザー作成
RUN useradd -m user && echo "user:iloveyou" | chpasswd

# cp の SUID 設定
RUN chmod u+s /bin/cp

# secret ファイル作成
RUN echo "FLAG{root_only_secret}" > /root/secret && \
    chown root:root /root/secret && \
    chmod 600 /root/secret

# SSHの脆弱設定
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# SSH ポート
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
