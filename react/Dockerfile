FROM node:20-alpine

# ===== 必要パッケージ =====
RUN apk add --no-cache \
    openssh \
    bash

# ===== 作業ディレクトリ =====
WORKDIR /app
COPY my-app/ /app/
RUN npm install
COPY ./pseudo-key /root/.ssh/id_rsa

EXPOSE 3000

# ===== SSH + Next.js を同時起動 =====
CMD bash -c "npm run dev"