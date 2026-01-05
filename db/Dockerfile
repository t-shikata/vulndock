FROM mysql:8.0

ENV MYSQL_ROOT_PASSWORD=rootpass
ENV MYSQL_DATABASE=company
ENV MYSQL_USER=appuser
ENV MYSQL_PASSWORD=apppass

# 初期SQLを自動実行させる
COPY init.sql /docker-entrypoint-initdb.d/init.sql

EXPOSE 3306